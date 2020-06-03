import 'package:todo_firebase/app/interfaces/todo_repository_interface.dart';
import 'package:todo_firebase/app/modules/edit/edit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/edit/edit_page.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';
import 'package:todo_firebase/app/stores/crudStores/update_todo_store.dart';

class EditModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EditController(i.get())),
        Bind((i) => UpdateTodoStore(i.get())),
        Bind<ITodoRepository>((i) => TodoRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => EditPage()),
      ];

  static Inject get to => Inject<EditModule>.of();
}
