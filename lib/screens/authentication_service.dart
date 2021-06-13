import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;


  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> logout() async{
    try{
      await _firebaseAuth.signOut();
      print("userCredential======>" );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  Future<User> googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final FirebaseAuth _auth = FirebaseAuth.instance;

    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn();

    var _authentication = await _googleSignInAccount.authentication;

    var _credential = GoogleAuthProvider.credential(
      idToken: _authentication.idToken,
      accessToken: _authentication.accessToken,
    );

    User user = (await _auth.signInWithCredential(_credential)).user;
    return user;
  }

  Future<String> login({String email, String password}) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  Future<String> register({String email, String password}) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> send_password_reset_email({String email}) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Check your email";
    } on FirebaseAuthException catch(e){
      return (e.code);
    }
  }
}