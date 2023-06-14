import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:ui_bardi/Todolist/task.dart';
import 'package:ui_bardi/Todolist/todos_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(

        checkColor: Colors.black,
        activeColor: Colors.cyan,
        value: task.completed,
        onChanged: (bool) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title ,style: const TextStyle(color: Color(
          0xFFFFFFFF),),),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
        },
      ),
    );
  }
}
