import 'package:flutter/material.dart';
import 'package:my_todo_list/constants.dart';
import 'package:my_todo_list/model/provider/task_data.dart';
import 'package:provider/provider.dart';

import 'confirmationDialog.dart';

class TasksList extends StatelessWidget {
  final String categoryName;

  const TasksList({Key key, this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('$categoryName tasks'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //TODO go to add task page.
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Consumer<TaskData>(builder: (
          context,
          task,
          child,
        ) {
          return ListView.builder(
              itemCount: task.taskCount,
              itemBuilder: (context, index) {
                final todos = task.tasks[index];
                return Container(
                  color: kPrimaryColor.withOpacity(0.04),
                  padding: EdgeInsets.all(10.0),
                  child: Dismissible(
                    key: ValueKey(todos.todo),
                    child: ListTile(
                      title: Text(
                        todos.todo,
                        style: TextStyle(
                            decoration: todos.isDone
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      subtitle: Text(
                        DateTime.now().toString(),
                      ),
                      trailing: Checkbox(
                          value: todos.isDone,
                          onChanged: (value) {
                            task.updateTask(todos);
                          }),
                    ),
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      color: Colors.red[300],
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (context) => ConfirmationDialog(
                          title: 'Delete Task',
                          contentText:
                              'Are you sure you want to delete this task?',
                        ),
                      );
                    },
                    onDismissed: (direction) => task.deleteTask(todos),
                  ),
                );
              });
        }),
      ),
    );
  }
}
