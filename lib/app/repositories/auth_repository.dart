import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/app/interfaces/auth_respository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future loginEmailAndPass({String email, String password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .catchError((e) {
      return e;
    });
  }

  @override
  Future<void> registerEmailAndPass({String email, String password}) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .then((auth) {
      return true;
    }).catchError((e) {
      print("ERRO" + e.toString());
      return null;
    });
  }

  @override
  Future loginGoogle() async {
    try {
      var googleSignIn = GoogleSignIn();
      // Logado com o google. Mas ainda nao com o firebase.
      var googleSignInAccount = await googleSignIn.signIn();

      // Pegar a auth
      var googleSignInAuthentication = await googleSignInAccount.authentication;

      FirebaseUser firebaseUser;

      // Se realmente recebeu acesso, entao busque as credenciais.
      if (googleSignInAuthentication.accessToken != null) {
        var credential = GoogleAuthProvider.getCredential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await firebaseAuth.signInWithCredential(credential).then((auth) {
          firebaseUser = auth.user;
        });
      }
    } catch (e) {
      return e;
    }
  }

  @override
  Future<FirebaseUser> getUser() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    return currentUser;
  }

  @override
  Future logOut() async {
    return await firebaseAuth.signOut();
  }
}
