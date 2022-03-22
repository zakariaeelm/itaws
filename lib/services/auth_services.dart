import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Authentication/sign_in.dart';
import 'package:maan_food/Screens/Home/home.dart';
import 'package:maan_food/services/user_provider.dart';
import 'package:maan_food/services/utils.dart';
import 'package:maan_food/widgets/map.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

String _userType = '';

Future<void> showDialogUserType(
    BuildContext ctx, Map<String, dynamic> userData) async {
  Platform.isAndroid
      ? showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    saveUserToDataBase(userData, ctx, 'consumer');
                  },
                  child: const Text('Consumer'),
                ),
                TextButton(
                  onPressed: () {
                    saveUserToDataBase(userData, ctx, 'provider');
                  },
                  child: const Text('Provider'),
                ),
              ],
            );
          },
        )
      : showCupertinoDialog(
          context: ctx,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text("User type"),
              content: const Text("Please choose which user type are you"),
              actions: [
                CupertinoDialogAction(
                    child: const Text("Consumer"),
                    onPressed: () async {
                      saveUserToDataBase(userData, ctx, 'consumer');
                    }),
                CupertinoDialogAction(
                  child: const Text("Provider"),
                  onPressed: () async {
                    saveUserToDataBase(userData, ctx, 'provider');
                  },
                )
              ],
            );
          },
        );
}

void saveUserToDataBase(Map<String, dynamic> userData, BuildContext context,
    String userType) async {
  UserModel userModel = UserModel(email: '', uid: '', name: '');
  Map<String, dynamic> userJson = userData;
  userJson['userType'] = userType;
  userModel.fromJson(userJson);
  context.read<CurrentUserProvider>().setCurrentUSer(userModel);
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userJson['uid'])
      .set(userJson);

  Navigator.of(context).pop();
  launchHomeScreen(context);
}

void signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  try {
    showLoader(context);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final Map<String, dynamic> userJson = {
      'uid': userCredential.user!.uid,
      'email': userCredential.user!.email,
      'imageUrl': userCredential.user!.photoURL,
      'name': userCredential.user!.displayName
    };
    if (userCredential.additionalUserInfo!.isNewUser) {
      hideLoader(context);
      await showDialogUserType(context, userJson);
    } else {
      // retrieve user from data base and set Up currentUser in the global state
      getCurrentUserData(context, userCredential.user!.uid);

      launchHomeScreen(context);
      hideLoader(context);
    }
  } on FirebaseAuthException catch (e) {
    hideLoader(context);
    printSnackBarErrorMessage(
        context, 'there was an error Signing In with Google');
  }
}

void signInWithFacebook(BuildContext context) async {

  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  if (loginResult.status == LoginStatus.success) {
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userData = await FacebookAuth.instance.getUserData();
    // Once signed in, return the UserCredential
    try {
      showLoader(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final Map<String, dynamic> userJson = {
        'uid': userCredential.user!.uid,
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name']
      };

      if (userCredential.additionalUserInfo!.isNewUser) {
        hideLoader(context);
        showDialogUserType(context, userJson);
      } else {
        // retrieve user from data base and set Up currentUser in the global state
        getCurrentUserData(context, userCredential.user!.uid);
        launchHomeScreen(context);
        hideLoader(context);
      }
    } on FirebaseAuthException catch (e) {
      hideLoader(context);
      printSnackBarErrorMessage(
          context, 'there was an error Signing In with facebook');
    }
  }
}

void launchHomeScreen(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return const Home();
      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }),
          (Route route) => false);
}

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  context
      .read<CurrentUserProvider>()
      .setCurrentUSer(UserModel(email: '', uid: '', name: ''));
  Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return const SignIn();
      }, transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }),
      (Route route) => false);
}

void signUpWithEmailAndPassword(String userEmail, String userPassword,
    String userName, String userType, BuildContext context) async {
  try {
    showLoader(context);
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);

    final userJson = {
      'userType': userType,
      'uid': userCredential.user!.uid,
      'email': userCredential.user!.email,
      'name': userName
    };
    UserModel userModel = UserModel(email: '', uid: '', name: '');
    userModel.fromJson(userJson);
    context.read<CurrentUserProvider>().setCurrentUSer(userModel);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set(userJson);

    launchHomeScreen(context);
    hideLoader(context);
  } on FirebaseAuthException catch (e) {
    hideLoader(context);
    if (e.code == 'weak-password') {
      String ErrorMsg = e.message!;
      printSnackBarErrorMessage(
          context, 'The password provided is too weak.' + ErrorMsg);
    } else if (e.code == 'email-already-in-use') {
      printSnackBarErrorMessage(
          context, 'The account already exists for that email.');
    }
  } catch (e) {
    hideLoader(context);
    print(e);
    printSnackBarErrorMessage(context, 'An error occurred');
  }
}

void signInWithEmailAndPassword(
    String userEmail, String userPassword, BuildContext context) async {
  try {
    showLoader(context);
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userEmail, password: userPassword);
    launchHomeScreen(context);
    hideLoader(context);
  } on FirebaseAuthException catch (e) {
    hideLoader(context);
    if (e.code == 'user-not-found') {
      printSnackBarErrorMessage(
          context, 'No user found for that email. try and sign Up');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      printSnackBarErrorMessage(context, 'Wrong password or email provided');
    }
  } catch (e) {
    hideLoader(context);
    printSnackBarErrorMessage(context, 'An error occurred');
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    printSnackBarErrorMessage(context, errorText) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorText), backgroundColor: Theme.of(context).errorColor));
}
