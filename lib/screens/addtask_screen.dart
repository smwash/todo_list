import 'package:flutter/material.dart';
import 'package:my_todo_list/constants.dart';
import 'package:my_todo_list/model/provider/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;
  String categoryTitle;
  DateTime _startDate;
  DateTime endDate;

  void pickStartDate() async {
    final startDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    setState(() {
      _startDate = startDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff757575),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06, vertical: size.height * 0.03),
          margin: EdgeInsets.only(top: size.height * 0.1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
          ),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: kPrimaryColor,
                        size: size.height * 0.05,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Text(
                    'New Task',
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  TextFormField(
                    enableSuggestions: true,
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: kTextFieldDecoration.copyWith(
                      labelText: 'What are you planning?',
                      labelStyle: TextStyle(
                        fontSize: size.height * 0.023,
                      ),
                    ),
                    onChanged: (value) {
                      newTaskTitle = value;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start Date: ',
                        style: TextStyle(
                          fontSize: size.height * 0.023,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: kPrimaryColor, width: 2),
                            ),
                            child: Text(
                              _startDate == null
                                  ? 'No Date picked'
                                  : _startDate.toString(),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'End Date: ',
                        style: TextStyle(
                          fontSize: size.height * 0.023,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: kPrimaryColor, width: 2),
                            ),
                            child: Text('No Date picked'),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: kPrimaryColor,
                            ),
                            onPressed: pickStartDate,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter a Category: ',
                      style: TextStyle(
                        fontSize: size.height * 0.023,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: TextFormField(
                      maxLength: 20,
                      enableSuggestions: true,
                      autocorrect: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Eg. personal, work, study, shopping',
                      ),
                      onChanged: (value) {
                        categoryTitle = value;
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 0.0,
                    color: kPrimaryColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTaskTitle);
                      Provider.of<TaskData>(context, listen: false)
                          .addCategory(categoryTitle);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
