import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/interfaces/auth_respository_interface.dart';
import 'package:todo_firebase/app/models/user.model.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  var user = UserModel();
  //UserModel user;

  IAuthRepository authRepository;

  _AuthControllerBase() {
    authRepository = Modular.get<IAuthRepository>();
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
    user.setEmail("");
    return await authRepository.logOut();
  }
}