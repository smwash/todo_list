import 'package:flutter/material.dart';
import 'package:my_todo_list/model/provider/task_data.dart';
import 'package:provider/provider.dart';
import 'categoryTile.dart';

class AddCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final category = Provider.of<TaskData>(context);
    return category.categories.isEmpty
        ? Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('images/noTask.png'),
                SizedBox(
                  height: size.height * 0.015,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'No tasks to ',
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'check',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: category.categoryCount,
                itemBuilder: (context, index) {
                  final categoryData = category.categories[index];
                  final tasks = category.tasks[index];
                  return AspectRatio(
                    aspectRatio: 3.5,
                    child: Container(
                      //padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: CategoryTile(
                          category: category,
                          categoryData: categoryData,
                          tasks: tasks),
                    ),
                  );
                }),
          );
  }
}
