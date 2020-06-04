import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/interfaces/auth_respository_interface.dart';
import 'package:todo_firebase/app/models/user.model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository authRepository;
  _AuthStoreBase(this.authRepository);

  var user = UserModel();

  Future loginWithGoogle() async {
    return await authRepository.loginGoogle().then((value) {
      authRepository.getUser().then((value) {
        user.setEmail(value.email);
        user.setNome(value.displayName);
      }).catchError((err) {
        print("Erro" + err.toString());
        return err;
      });
    }).catchError((err) {
      print("Erro" + err.toString());
      return err;
    });
  }

  Future registerEmail(String email, String password) async {
    return await authRepository.registerEmailAndPass(
        email: email.trim(), password: password.trim());
  }

  Future loginEmailAndPass(String email, String password) async {
    return await authRepository
        .loginEmailAndPass(email: email.trim(), password: password.trim())
        .then((value) {
      authRepository.getUser().then((value) {
        user.setEmail(value.email);
      }).catchError((e) {
        return e;
      });
    });
  }

  Future<FirebaseUser> getUser() async {
    return await authRepository.getUser();
  }

  Future logOut() async {
    return await authRepository.logOut().then((value) {
      user.setEmail(null);
      user.setNome(null);
    }).catchError((err) {
      return err;
    });
  }
}
