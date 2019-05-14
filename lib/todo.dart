import 'package:flutter_web/material.dart';
import 'data/Todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;
  final Function onSave;
  final Function onEdit;

  TodoWidget(this.todo, {this.onSave, this.onEdit});

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.todo.title;
  }

  @override
  void dispose() {
    super.dispose();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.todo.isEditing
          ? Row(
              children: <Widget>[textInput(), doneButton()],
            )
          : Row(
              children: <Widget>[
                Expanded(child: Text(widget.todo.title)),
                editButton()
              ],
            ),
    );
  }

  Widget textInput() => Expanded(
        child: TextField(
          controller: controller,
          autofocus: true,
        ),
      );

  Widget doneButton() => IconButton(
      icon: Icon(Icons.check),
      onPressed: () {
        widget.onSave(controller.text, widget.todo.id);
      });

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        this.widget.onEdit(this.widget.todo.id);
      });
}
