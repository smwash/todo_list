import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:my_todo_list/model/categorydata.dart';
import 'package:my_todo_list/model/todo_data.dart';

class TaskData with ChangeNotifier {
  List<Todos> _tasks = [];
  List<Category> _categories = [];

  UnmodifiableListView<Todos> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Category> get categories {
    return UnmodifiableListView(_categories);
  }

  // Start of categories

  void addTask(String newTask) {
    final task = Todos(todo: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void addCategory(String newCategory) {
    final category = Category(category: newCategory);
    _categories.add(category);
    notifyListeners();
  }

  int get categoryCount {
    return _categories.length;
  }

  void updatefavoriteCategory(Category category) {
    category.toggleFavorite();
    notifyListeners();
  }

  void deleteCategory(Category category) {
    _categories.remove(category);
    notifyListeners();
  }

  // End of categories

  // Start of tasks
  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Todos task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Todos task) {
    _tasks.remove(task);
    notifyListeners();
  }

  //End dof tasks
}
