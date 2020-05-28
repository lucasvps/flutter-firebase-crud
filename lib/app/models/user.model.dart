import 'package:mobx/mobx.dart';


part 'user.model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {

  _UserModelBase({this.email, this.nome});
  @observable
  String email;

  @action
  setEmail(String value) => email = value;
  
  @observable
  String nome;

  @action
  setNome(String value) => nome = value;
}