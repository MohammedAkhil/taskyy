import 'package:flutter_web/material.dart';
import 'data/Todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  final Function onSave;
  final TextEditingController controller = TextEditingController();

  TodoWidget(this.todo, {this.onSave});

  @override
  Widget build(BuildContext context) => ListTile(
        title: todo.isEditing
            ? Row(
                children: <Widget>[textInput(), doneButton()],
              )
            : Text(todo.title),
      );

  Widget textInput() => Expanded(
        child: TextField(
          controller: controller,
        ),
      );

  Widget doneButton() => IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        onSave(controller.text, todo.id);
      });
}
