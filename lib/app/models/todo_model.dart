import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  DocumentReference reference;

  TodoModel({this.title, this.check = false, this.reference});

  factory TodoModel.fromDocs(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'], check: doc['check'], reference: doc.reference);
  }

  Future save() async {
    if (reference == null) {
      reference = await Firestore.instance
          .collection('todo')
          .add({'title': title, 'check': check});
    } else {
      reference.updateData({'title': title, 'check': check});
    }
  }
}
