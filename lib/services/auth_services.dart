import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maan_food/Screens/Authentication/sign_in.dart';
import 'package:maan_food/Screens/Home/home.dart';
import 'package:maan_food/services/utils.dart';
import 'package:maan_food/widgets/map.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
    if (userCredential.additionalUserInfo!.isNewUser) {
      await FirebaseFirestore.instance.collection('users').add({
        'email': userCredential.user!.email,
        'imageUrl': userCredential.user!.photoURL,
        'name': userCredential.user!.displayName
      });
    }
    const Home().launch(context);
    hideLoader(context);
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

      if (userCredential.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance.collection('users').add({
          'email': userData['email'],
          'imageUrl': userData['picture']['data']['url'],
          'name': userData['name']
        });
      }
      const Home().launch(context);
      hideLoader(context);
    } on FirebaseAuthException catch (e) {
      hideLoader(context);
      printSnackBarErrorMessage(
          context, 'there was an error Signing In with facebook');
    }
  }
}

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  const SignIn().launch(context);
}

void signUpWithEmailAndPassword(
    String userEmail, String userPassword, BuildContext context) async {
  try {
    showLoader(context);
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);
    const Home().launch(context);
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
    printSnackBarErrorMessage(
        context, 'An error occurred');
  }
}

void signInWithEmailAndPassword(
    String userEmail, String userPassword, BuildContext context) async {
  try {
    showLoader(context);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: userEmail, password: userPassword);
    const Home().launch(context);
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
    printSnackBarErrorMessage(
        context, 'An error occurred');
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    printSnackBarErrorMessage(context, errorText) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorText), backgroundColor: Theme.of(context).errorColor));
}
