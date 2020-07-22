import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff1f4287);

const kTextFieldDecoration = InputDecoration(
  labelText: '',
  labelStyle: TextStyle(
    color: kPrimaryColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
);
