import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = "some error occurred";

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        // String photoUrl =
        // await StorageMethods().uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          following: [],
          followers: [],
        );

        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "success";
      } else {
        res = "please enter all the fields.";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some err occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = "please enter all fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }
}
