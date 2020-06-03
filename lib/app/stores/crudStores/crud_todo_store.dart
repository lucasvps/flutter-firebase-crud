import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';

part 'crud_todo_store.g.dart';

class CrudTodoStore = _CrudTodoStoreBase with _$CrudTodoStore;

abstract class _CrudTodoStoreBase with Store {
  final TodoRepository todoRepository;


  // Utilizada na second page, para update do checkbox, e deletar todo.
  // Busca todos da collection
  

  _CrudTodoStoreBase(this.todoRepository);

  
  // Apenas para alterar o checkBox
  Future updateTodo(TodoModel todoModel, String documentId) async {
    return await todoRepository.updateTodo(todoModel, documentId);
  }

  Future deleteTodo(String documentId) async {
    return await todoRepository.deleteTodo(documentId);
  }

  Future getAllTodo() async {
    return await todoRepository.getTodo();
  }

  Stream getAllTodoStream() {
    return todoRepository.streamGetTodo();
  }

}