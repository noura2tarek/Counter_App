//-- Snack bar --//
import 'package:flutter/material.dart';

SnackBar mySnackBar({required String message}) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevation: 1.0,
    duration: Duration(milliseconds: 1500),
    backgroundColor: Colors.teal.shade300,
  );
}