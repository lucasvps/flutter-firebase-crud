import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';

part 'create_todo_store.g.dart';

class CreateTodoStore = _CreateTodoStoreBase with _$CreateTodoStore;

abstract class _CreateTodoStoreBase with Store {
  final TodoRepository todoRepository;

  _CreateTodoStoreBase(this.todoRepository);

  @observable
  String title;
  @action
  setTitle(String value) => title = value;

  Future addTodo(TodoModel todoModel) async {
    return await todoRepository.addTodo(todoModel);
  }

  
}