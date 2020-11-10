import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //Anon signin(

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future signinAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Login through email
  Future signInemail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error - "+e.toString());
      return null;
    }
  }

  //SignUp through email
  Future signUpemail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Signup through google
  Future googleSignIn() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final UserCredential usercredential =
          await _auth.signInWithCredential(credential);

      final User user = usercredential.user;
      assert(!user.isAnonymous);
      assert(user.getIdToken() != null);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  //SignOut
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error " + e.toString());
      return "Error";
    }
  }
}