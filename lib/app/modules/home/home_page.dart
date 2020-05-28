import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/core/controller/auth_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    Modular.get<AuthController>().getUser().then((value) async {
      await Modular.get<AuthController>().user.setEmail(value.email);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Modular.get<AuthController>().logOut();
                })
          ],
          title: Text(widget.title),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('LOGIN'),
                  onPressed: () {
                    Modular.get<AuthController>()
                        .loginEmailAndPass(email.text, password.text)
                        .catchError((e) {
                      print('NOT LOGGED');
                    });
                  },
                ),
                Observer(builder: (_) {
                  return Text(Modular.get<AuthController>().user.email != null
                      ? Modular.get<AuthController>().user.email
                      : "");
                }),
                RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed('/second');
                  },
                  child: Text('second page'),
                )
              ],
            ),
          ),
        ));
  }
}
