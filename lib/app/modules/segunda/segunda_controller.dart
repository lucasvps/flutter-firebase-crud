import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/user.model.dart';
part 'segunda_controller.g.dart';

class SegundaController = _SegundaControllerBase with _$SegundaController;

abstract class _SegundaControllerBase with Store {

  
  var user = UserModel();
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
