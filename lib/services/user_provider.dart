
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserModel{
  late String uid;
  late String email;
  late String? imageUrl;
  late String name;

  UserModel({required this.uid, required this.email, this.imageUrl, required this.name});

  fromJson(json){
    uid= json['uid'];
    email = json['email'];
    if(json['imageUrl'] != null) {
      imageUrl = json['imageUrl'];
    }
    name= json['name'];
  }

  Map<String, dynamic> toJson() =>
      {
        'uid': uid,
        'email': email,
        'imageUrl': imageUrl,
        'name': name,
      };
}


getCurrentUserData(BuildContext context, String uid) async {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('users');

  DocumentSnapshot<Object?> documentSnapshotUser = await _collectionRef.doc(uid).get();
  late UserModel user = UserModel( email: '', uid: '', name: '');
  final result = documentSnapshotUser.data();
  user.fromJson(result);
   context.read<CurrentUserProvider>().setCurrentUSer(user);
}


// Manage loading state with the provider lib
class CurrentUserProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get currentUser => _user;
  setCurrentUSer(UserModel user) {
    _user = user;
    notifyListeners();
  }
}