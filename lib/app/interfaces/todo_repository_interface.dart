import 'package:todo_firebase/app/models/todo_model.dart';

abstract class ITodoRepository {
  Future addTodo(TodoModel todoModel);
  Future updateTodo(TodoModel todoModel, String documentId);
  Future deleteTodo(String documentId);
  Future getTodo();
  Stream streamGetTodo();

}