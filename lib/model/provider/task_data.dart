import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_list/model/addtextFields.dart';
import 'package:my_todo_list/model/categorydata.dart';
import 'package:my_todo_list/model/todo_data.dart';

class MyDateRange {
  DateTimeRange pickedRangedate;
  MyDateRange({this.pickedRangedate});
}

class TaskData with ChangeNotifier {
  List<Todos> _tasks = [];
  List<Category> _categories = [];
  List<Textfields> _textFields = [];
  DateTimeRange _dateTimeRange;
  TimeOfDay _timeOfDay;
  DateTime _dueDate;

  DateTime get dueDate {
    return _dueDate;
  }

  DateTimeRange get dateRange {
    return _dateTimeRange;
  }

  TimeOfDay get timeofDay {
    return _timeOfDay;
  }

  UnmodifiableListView<Todos> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Category> get categories {
    return UnmodifiableListView(_categories);
  }

  UnmodifiableListView<Textfields> get textFields {
    return UnmodifiableListView(_textFields);
  }
  // Start of categories

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

  // Start of  Tasks

  void addTask(String newTask) {
    final task = Todos(todo: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Todos task) {
    task.toggleDone();
    notifyListeners();
  }

  void updateOnComplete() {
    _tasks.length - 1;
  }

  void deleteTask(Todos task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void addDate(DateTimeRange datePicked) {
    //final date = MyDateRange(pickedRangedate: datePicked);
    _dateTimeRange = datePicked;
    notifyListeners();
  }

  Future<void> pickStartDate(
    BuildContext context,
    DateTimeRange pickedRangeDate,
  ) async {
    pickedRangeDate = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (pickedRangeDate != null) {
      _dateTimeRange = pickedRangeDate;
    } else {
      _dateTimeRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now(),
      );
    }

    notifyListeners();
  }

  // final TimeOfDay time = await showTimePicker(
  //       context: context,
  //        initialTime: TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: 00),);

  //       if(time != null){
  //         _dueDate = DateTime(pickedRangeDate.start.year, pickedRangeDate.start.month, pickedRangeDate.start.day, time.hour, time.minute);
  //       }

  //  Future<Null> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  //End dof tasks

  //Add textfield:

  // void addTextField(TextFormField newTextfield){
  //   final textField = Textfields(textfield: newTextfield);
  // }

}
