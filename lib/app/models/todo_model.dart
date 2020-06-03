class TodoModel {

  String title;
  bool check;
  final String documentId;

  
  TodoModel({this.documentId, this.title, this.check});

  Map<String, dynamic> toMap() {
    return {'title': title, 'check': check};
  }

  factory TodoModel.fromMap(Map<String, dynamic> map, String documentId) {
    return TodoModel(
      title: map['title'],
      check: map['check'],
      documentId: documentId,
    );
  }
}