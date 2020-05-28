

abstract class IAuthRepository {
  Future loginGoogle();
  Future registerEmailAndPass({String email, String password});
  Future loginEmailAndPass({String email, String password});
  Future getUser();
  Future logOut();
}