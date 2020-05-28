import 'package:todo_firebase/app/modules/segunda/segunda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/modules/segunda/segunda_page.dart';

class SegundaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SegundaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SegundaPage()),
      ];

  static Inject get to => Inject<SegundaModule>.of();
}
