import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_chaty/model/user.dart';
class Authentification {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ChatUser? _userFromFirebaseUser(User user) {
    return user != null ? ChatUser(uid: user.uid) : null;
  }
  Stream<ChatUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email,
          password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(exception) {
      print(exception.toString());
      return null;
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email,
          password: password);
      User? user = result.user;
      //TODO store new user in Firestore
      return _userFromFirebaseUser(user);
    }catch(exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(exception) {
      print(exception.toString());
      return null;
    }
  }
}