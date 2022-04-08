import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white70,
  filled: true,
  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  errorBorder: OutlineInputBorder(
      borderSide : BorderSide(color: Colors.redAccent, width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide : BorderSide(color: Colors.black87, width: 1),
  ),


  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1),
  ),
);