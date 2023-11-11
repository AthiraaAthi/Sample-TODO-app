import 'package:flutter/material.dart';
import 'package:flutter_application_15_/view/home_screen/home_screen.dart';

void main() {
  runApp(TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}