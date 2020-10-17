import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String id;
  String content;
  Timestamp dateCreated;
  bool done;

  TodoModel({this.dateCreated, this.done, this.id, this.content});

  TodoModel.fromDoc(DocumentSnapshot doc) {
    this.id = doc.documentID;
    this.content = doc['content'];
    this.dateCreated = doc['dateCreated'];
    this.done = doc['done'];
  }
}
