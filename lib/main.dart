import 'package:flutter/material.dart';
import 'package:math_play/functions.dart';
import 'package:math_play/screens/my_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    customStatusBar(Colors.transparent, Colors.grey.shade300, Brightness.dark,
        Brightness.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyMainPage(),
    );
  }
}
