import 'package:flutter/material.dart';

class Textfields {
  bool isAdded;
  TextFormField textfield;

  Textfields({this.textfield, this.isAdded = false});

  void toggleAdded() {
    isAdded = !isAdded;
  }
}
