import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'package:todo_firebase/app/modules/edit/edit_page.dart';
import 'package:todo_firebase/app/stores/auth_store.dart';
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
        body: StreamBuilder(
          stream: controller.fetchAllTodoStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            if (snapshot.hasData) {
              return listView(snapshot.data);
            }
          },
        ));
  }

  Widget listView(List<TodoModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.delete), onPressed: (){
                controller.deleteTodo(list[index].documentId);
              }),
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPage(todoModel: list[index],)),
                    );
                  }),
              Expanded(
                child: SizedBox(
                  child: Card(
                    child: CheckboxListTile(
                      value: list[index].check,
                      onChanged: (value) {
                        print(list[index].documentId);
                        controller.updateCheckBox(
                            TodoModel(title: list[index].title, check: value),
                            list[index].documentId);
                      },
                      title: Text(list[index].title),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// FutureBuilder(
//           future: controller.fetchAllTodo(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData)
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             if (snapshot.hasData) {
//               return listView(snapshot.data);
//             }
//           },
//         )
