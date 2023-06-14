import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ui_bardi/Todolist/task.dart';
import 'package:ui_bardi/Todolist/task_list.dart';
import 'package:ui_bardi/Todolist/todos_model.dart';

class TasksTab extends StatelessWidget {
  
  final UnmodifiableListView<Task> Function(TodosModel) getTasks;

  TasksTab(this.getTasks) {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xffaaaaaa),
      // This is Provider's Consumer
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
          tasks: getTasks(todos),
        ),
      ),
    );
  }
}
