import 'package:uuid/uuid.dart';
var uuid = Uuid();


class Todo {
  final String id;
  String title;
  bool isCompleted;
  bool isEditing;

  Todo({this.title, this.isCompleted = false, this.isEditing = true}): this.id =  uuid.v1();
}
