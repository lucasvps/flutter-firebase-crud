import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/core/controller/auth_controller.dart';
import 'segunda_controller.dart';

class SegundaPage extends StatefulWidget {
  final String title;
  const SegundaPage({Key key, this.title = "Segunda"}) : super(key: key);

  @override
  _SegundaPageState createState() => _SegundaPageState();
}

class _SegundaPageState extends ModularState<SegundaPage, SegundaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text(Modular.get<AuthController>().user.email != null ? Modular.get<AuthController>().user.email : "OLÁ MEUS AMIGOS"))
        ],
      ),
    );
  }
}
