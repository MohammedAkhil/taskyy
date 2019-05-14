import 'package:flutter_web/material.dart';
import 'data/Todo.dart';
import 'todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoList;
  final Function onSave;

  TodoList({@required this.todoList, this.onSave});

  @override
  Widget build(BuildContext context) {
    print(todoList.length);
    return Container(
      margin: EdgeInsets.all(8),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return buildTodo(index);
        },
        shrinkWrap: true,
        itemCount: todoList.length,
      ),
    );
  }

  Widget buildTodo(int index) {
    return TodoWidget(this.todoList[index], onSave: this.onSave,);
  }
}
