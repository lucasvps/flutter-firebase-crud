import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';

part 'update_todo_store.g.dart';

class UpdateTodoStore = _UpdateTodoStoreBase with _$UpdateTodoStore;

abstract class _UpdateTodoStoreBase with Store {
  final TodoRepository todoRepository;

  _UpdateTodoStoreBase(this.todoRepository);

  Future updateTodoName(TodoModel todoModel, String documentId) async {
    return await todoRepository.updateTodo(todoModel, documentId);
  }
}