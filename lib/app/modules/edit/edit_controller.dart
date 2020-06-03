import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/stores/crudStores/update_todo_store.dart';

part 'edit_controller.g.dart';

class EditController = _EditControllerBase with _$EditController;

abstract class _EditControllerBase with Store {
  final UpdateTodoStore _updateTodoStore;

  _EditControllerBase(this._updateTodoStore);

  Future updateTodo(TodoModel todoModel, String documentId) async {
    return await _updateTodoStore.updateTodoName(todoModel, documentId);
  }
}
