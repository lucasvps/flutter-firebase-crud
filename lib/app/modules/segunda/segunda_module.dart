import 'package:todo_firebase/app/interfaces/todo_repository_interface.dart';
import 'package:todo_firebase/app/modules/edit/edit_controller.dart';
import 'package:todo_firebase/app/modules/segunda/segunda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/segunda/segunda_page.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';
import 'package:todo_firebase/app/stores/crudStores/update_todo_store.dart';
import 'package:todo_firebase/app/stores/crudStores/crud_todo_store.dart';

class SegundaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SegundaController(i.get())),
        Bind((i) => CrudTodoStore(i.get())),
        Bind<ITodoRepository>((i) => TodoRepository()),
        Bind((i) => EditController(i.get())),
         Bind((i) => UpdateTodoStore(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SegundaPage()),
      ];

  static Inject get to => Inject<SegundaModule>.of();
}
