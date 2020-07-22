import 'package:flutter/material.dart';
import 'package:my_todo_list/constants.dart';

import 'package:my_todo_list/model/todo_data.dart';
import 'package:my_todo_list/widgets/addcategory.dart';
import 'package:my_todo_list/widgets/task_list.dart';

import 'addtask_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todos> todosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('My Todos'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (
                  //TODO implement search functionality
                  ) {}),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (
                  //TODO implement popup functionality
                  ) {}),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: AddCategory(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor.withOpacity(0.9),
        label: Text('Add Task'),
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              builder: (context) {
                return AddTaskScreen();
              });
        },
      ),
    );
  }
}
