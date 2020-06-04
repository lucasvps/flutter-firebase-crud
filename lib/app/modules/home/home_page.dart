import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/core/controller/auth_controller.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/models/user.model.dart';
import 'package:todo_firebase/app/stores/auth_store.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    Modular.get<AuthController>().getUser().then((value) async {
      await Modular.get<AuthStore>().user.setEmail(value.email);
      await Modular.get<AuthStore>().user.setNome(value.displayName);
    });
    super.initState();
  }

  UserModel authUser = Modular.get<AuthStore>().user;

  TextEditingController _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Modular.to.pushNamed('/second');
          },
          child: Icon(Icons.arrow_forward),
        ),
        appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: authUser.email == null
                      ? null
                      : () {
                          Modular.get<AuthController>().logout();
                          Modular.to.pushReplacementNamed('/login');
                        }),
              IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: authUser.email == null
                      ? () {
                          Modular.to.pushReplacementNamed('/login');
                        }
                      : null),
            ],
            title: Observer(builder: (_) {
              return Text((authUser.nome == null && authUser.email == null)
                  ? "Olá!"
                  : (authUser.nome == null && authUser.email != null)
                      ? "Olá, " + authUser.email
                      : authUser.nome != null
                          ? "Olá, " + authUser.nome + "!"
                          : "");
            })),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Observer(builder: (_) {
                    return Column(
                      children: <Widget>[
                        TextField(
                          controller: _title,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          onChanged: controller.createTodoStore.setTitle,
                        ),
                        RaisedButton(
                          onPressed: () {
                            print(controller.createTodoStore.title);
                            TodoModel todoModel = TodoModel(
                              check: false,
                              title: controller.createTodoStore.title,
                            );
                            controller.newTodo(todoModel);
                            _title.text = "";
                          },
                          child: Text('Add TODO'),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}
