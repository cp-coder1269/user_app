import 'package:flutter/material.dart';
import 'package:user_app/forms/new_request_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyForm(),
    );
  }
}
