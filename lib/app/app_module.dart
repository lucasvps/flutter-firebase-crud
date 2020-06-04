import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/app/app_widget.dart';
import 'package:todo_firebase/app/modules/edit/edit_module.dart';
import 'package:todo_firebase/app/modules/home/home_module.dart';
import 'package:todo_firebase/app/modules/login/login_module.dart';
import 'package:todo_firebase/app/modules/segunda/segunda_module.dart';

import 'core/controller/auth_controller.dart';
import 'interfaces/auth_respository_interface.dart';
import 'repositories/auth_repository.dart';
import 'stores/auth_store.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind((i) => AuthController(i.get())),
        Bind((i) => AppController()),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        Bind((i) => AuthStore(i.get()))
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/second', module: SegundaModule()),
        Router('/edit', module: EditModule()),
        Router('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
