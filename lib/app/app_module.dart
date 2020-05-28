import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo_firebase/app/app_widget.dart';
import 'package:todo_firebase/app/modules/home/home_module.dart';
import 'package:todo_firebase/app/modules/segunda/segunda_module.dart';

import 'core/controller/auth_controller.dart';
import 'interfaces/auth_respository_interface.dart';
import 'repositories/auth_repository.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
        Bind((i) => AppController()),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/second', module: SegundaModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
