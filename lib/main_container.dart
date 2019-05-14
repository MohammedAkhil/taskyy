import 'package:flutter_web/material.dart';
import 'todo_list.dart';
import 'data/Todo.dart';
import 'button.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'taskyy',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Button(
            onTap: this.addNewTask,
          ),
          Divider(),
          TodoList(
            todoList: todoList,
            onSave: this.onSave,
            onEdit: this.onEditTask,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  void addNewTask() {
    setState(() {
      todoList.add(Todo(
        title: '',
      ));
    });
  }

  void onSave(String title, String id) {
    todoList.forEach((Todo todo) {
      if (todo.id == id) {
        setState(() {
          todo.isEditing = false;
          todo.title = title;
        });
      }
    });
  }

  void onEditTask(String id) {
    print(id);
    todoList.forEach((Todo todo) {
      if (todo.id == id) {
        setState(() {
          todo.isEditing = true;
        });
      }
    });
  }
}
