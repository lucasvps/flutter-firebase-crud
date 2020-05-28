import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/models/todo_model.dart';

class TodoRepository {

  final Firestore firestore;
  TodoRepository(this.firestore);


  Stream<List<TodoModel>> listTodo(){
    return firestore.collection('todo').snapshots().map((query){
      return query.documents.map((doc){
        return TodoModel.fromDocs(doc);
      }).toList();
    });
  }




  }

