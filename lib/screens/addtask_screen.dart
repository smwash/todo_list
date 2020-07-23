import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTimeRange _startDate;
  //DateTime endDate;

  // void pickStartDate() async {
  //   final startDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2019),
  //     lastDate: DateTime.now(),
  //   );
  //   setState(() {
  //     _startDate = startDate;
  //   });
  // }

  // void addTextField() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'New Task',
          style: TextStyle(
            fontSize: size.height * 0.03,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06, vertical: size.height * 0.03),
        //margin: EdgeInsets.only(top: size.height * 0.1),
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
                SizedBox(
                  height: size.height * 0.015,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'What are you planning?',
                    style: TextStyle(
                      fontSize: size.height * 0.023,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  enableSuggestions: true,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter task name..',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a task';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    newTaskTitle = value;
                  },
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    onPressed: () {
                      TextFormField(
                        enableSuggestions: true,
                        autocorrect: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Task no. 2',
                        ),
                        onChanged: (value) {
                          newTaskTitle = value;
                        },
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add another task'),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
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
                    Consumer<TaskData>(builder: (context, datePicked, child) {
                      return Row(
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
                              datePicked.dateRange == null
                                  ? 'No Date picked'
                                  : DateFormat()
                                      .add_MMMMEEEEd()
                                      .format(datePicked.dateRange.start),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: kPrimaryColor,
                            ),
                            onPressed: () {
                              datePicked.pickStartDate(context, _startDate);
                              datePicked.addDate(_startDate);
                            },
                          ),
                        ],
                      );
                    }),
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
                    Consumer<TaskData>(
                      builder: (context, datePicked, child) {
                        return Row(
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
                                datePicked.dateRange == null
                                    ? 'No Date picked'
                                    : DateFormat()
                                        .add_MMMMEEEEd()
                                        .format(datePicked.dateRange.end),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                datePicked.pickStartDate(context, _startDate);
                                datePicked.addDate(_startDate);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter Task Category: ',
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
                Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
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
                        final data =
                            Provider.of<TaskData>(context, listen: false);
                        data.addTask(newTaskTitle);
                        data.addCategory(categoryTitle);

                        // if (newTaskTitle.isEmpty && categoryTitle.isEmpty) {
                        //   final snackBar = SnackBar(
                        //     content: RichText(
                        //       text: TextSpan(
                        //         children: [
                        //           TextSpan(
                        //             text:
                        //                 'Ummm...seems the text enterd can\`nt be',
                        //             style: TextStyle(
                        //                 fontSize: size.width * 0.05,
                        //                 color: Colors.black87,
                        //                 fontWeight: FontWeight.w600),
                        //           ),
                        //           TextSpan(
                        //             text: 'checked',
                        //             style: TextStyle(
                        //               fontSize: size.width * 0.05,
                        //               color: Colors.black87,
                        //               fontWeight: FontWeight.w600,
                        //               decoration: TextDecoration.lineThrough,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     backgroundColor: kPrimaryColor.withOpacity(0.8),
                        //   );
                        //   Scaffold.of(context).showSnackBar(snackBar);
                        // }

                        // else {
                        //   return null;
                        // }
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
