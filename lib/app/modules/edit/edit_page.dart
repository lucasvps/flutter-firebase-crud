import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_firebase/app/models/todo_model.dart';
import 'edit_controller.dart';

class EditPage extends StatefulWidget {
  final String title;
  final TodoModel todoModel;
  const EditPage({Key key, this.title = "Edit", this.todoModel})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends ModularState<EditPage, EditController> {
  //use 'controller' variable to access controller

  TextEditingController title = TextEditingController();

  @override
  void initState() {
    title.text = widget.todoModel.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: title,
              ),
            ),
            RaisedButton(
              onPressed: () {
                var newTodo = TodoModel(
                  title: title.text,
                  check: widget.todoModel.check
                );
                controller.updateTodo(newTodo, widget.todoModel.documentId);
                Modular.to.pop();
              },
              child: Text('UPDATE'),
            )
          ],
        ));
  }
}
