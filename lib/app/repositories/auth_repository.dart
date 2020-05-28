import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/app/interfaces/auth_respository_interface.dart';

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
  Future loginGoogle() {
    return null;
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
