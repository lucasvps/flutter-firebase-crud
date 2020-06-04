import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/core/controller/auth_controller.dart';
import 'package:todo_firebase/app/stores/auth_store.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: <Widget>[
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
                              .loginEmail(email.text, password.text)
                              .then((value) {
                                print('then ' + value.toString());
                            Modular.to.pushReplacementNamed('/');
                          }).catchError((err) {
                            print("catch error " + err.toString());
                          });
                        },
                      ),
                      Observer(builder: (_) {
                        return Text(Modular.get<AuthStore>().user.email != null
                            ? Modular.get<AuthStore>().user.email
                            : "");
                      }),
                      Observer(builder: (_) {
                        return RaisedButton(
                          color: Colors.orange,
                          child: Text(Modular.get<AuthStore>().user.nome != null
                              ? Modular.get<AuthStore>().user.nome
                              : 'LOGIN with GOOGLE'),
                          onPressed: () {
                            Modular.get<AuthController>()
                                .loginGoogle()
                                .then((value) {
                             Modular.to.pushReplacementNamed('/');
                            }).catchError((err) {
                              print('dialog here' + err.toString());
                            });
                          },
                        );
                      }),
                    ])))));
  }
}
