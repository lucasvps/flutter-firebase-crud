import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/interfaces/todo_repository_interface.dart';
import 'package:todo_firebase/app/models/todo_model.dart';

class TodoRepository implements ITodoRepository {
  final CollectionReference _todoCollectionReference =
      Firestore.instance.collection('todo');

  @override
  Future addTodo(TodoModel todoModel) async {
    try {
      await _todoCollectionReference.add(todoModel.toMap());
      return true;
    } catch (e) {
      return e;
    }
  }

  @override
  Future deleteTodo(String documentId) async {
    try {
      await _todoCollectionReference.document(documentId).delete();
    } catch (e) {
      return e;
    }
  }

  @override
  Future getTodo() async {
    try {
      var todoDocuments = await _todoCollectionReference.getDocuments();
      if (todoDocuments.documents.isNotEmpty) {
        return todoDocuments.documents
            .map((snapshot) =>
                TodoModel.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      }
    } catch (e) {
      return e;
    }
  }

  @override
  Future updateTodo(TodoModel todoModel, String documentId) async {
    try {
      await _todoCollectionReference
          .document(documentId)
          .updateData(todoModel.toMap());
    } catch (e) {
      return e;
    }
  }

  @override
  Stream streamGetTodo() {
    try {
      return _todoCollectionReference.snapshots().map((e) => e.documents
          .map((model) => TodoModel.fromMap(model.data, model.documentID))
          .toList());
    } catch (e) {
      return e;
    }
  }
}
