import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackthon/loginScreensM/Authentication/user.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user => _auth.currentUser;
   //create user object based on firebase user
  Useru? _userFromFirebaseUser(User? user) {
    return user != null ? Useru(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Useru?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }


//SIGN UP METHOD
  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHODJ
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _auth.signOut();

    print('signout');
  }
}
