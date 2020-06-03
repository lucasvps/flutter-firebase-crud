import 'package:todo_firebase/app/interfaces/todo_repository_interface.dart';
import 'package:todo_firebase/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/home/home_page.dart';
import 'package:todo_firebase/app/repositories/todo_repository.dart';
import 'package:todo_firebase/app/stores/crudStores/create_todo_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => CreateTodoStore(i.get())),
        Bind<ITodoRepository>((i) => TodoRepository())
        
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
