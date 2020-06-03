import 'package:mobx/mobx.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/stores/crudStores/create_todo_store.dart';


part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final CreateTodoStore createTodoStore;

  _HomeControllerBase(this.createTodoStore);


  Future newTodo(TodoModel todoModel) async {
    return await createTodoStore.addTodo(todoModel);
  }


  // Future updateTodo (TodoModel todoModel, String documentId) async {
  //   return await crudTodoStore.updateTodo(todoModel, documentId);
  // }
}
