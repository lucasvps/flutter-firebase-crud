import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/stores/crudStores/crud_todo_store.dart';
part 'segunda_controller.g.dart';

class SegundaController = _SegundaControllerBase with _$SegundaController;

abstract class _SegundaControllerBase with Store {

  
  final CrudTodoStore _crudTodoStore;

  _SegundaControllerBase(this._crudTodoStore);

  Future fetchAllTodo () async {
    return await _crudTodoStore.getAllTodo();
  }

  Stream fetchAllTodoStream () {
    return _crudTodoStore.getAllTodoStream();
  }

  Future updateCheckBox(TodoModel todoModel, String documentId) async {
    return await _crudTodoStore.updateTodo(todoModel, documentId);
  }

  Future deleteTodo(String documentId) async {
    return await _crudTodoStore.deleteTodo(documentId);
  }

  
}
