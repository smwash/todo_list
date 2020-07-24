import 'package:flutter/material.dart';
import 'package:my_todo_list/model/categorydata.dart';
import 'package:my_todo_list/model/provider/task_data.dart';
import 'package:my_todo_list/model/todo_data.dart';

import 'confirmationDialog.dart';
import 'task_list.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key key,
    @required this.category,
    @required this.categoryData,
    @required this.tasks,
  }) : super(key: key);

  final TaskData category;
  final Category categoryData;
  final Todos tasks;

  String taskNumber(int number) {
    if (number < 2) {
      return 'task';
    } else {
      return 'tasks';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            //category.updatefavoriteCategory(categoryData);
          }),
      title: Text(
        '${categoryData.category},  (${category.taskCount} ${taskNumber(category.taskCount)}) ',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(tasks.todo),
      trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            category.deleteCategory(categoryData);
          }),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TasksList(
              categoryName: categoryData.category,
            ),
          ),
        );
      },
    );
  }
}
