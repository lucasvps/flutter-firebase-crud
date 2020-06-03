import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/stores/auth_store.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthStore _authStore;

  _AuthControllerBase(this._authStore);


  Future loginGoogle() async {
    return await _authStore.loginWithGoogle();
  }

  Future registerLoginEmail(String email, String password) async {
    return await _authStore.registerEmail(email, password);
  }

  Future loginEmail(String email, String password) async {
    return await _authStore.loginEmailAndPass(email, password);
  }

  Future<FirebaseUser> getUser () async {
    return await _authStore.getUser();
  }

  Future logout () async {
    return await _authStore.logOut();
  }

}
