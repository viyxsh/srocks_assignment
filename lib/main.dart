import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.Rocks.Music',
      home: Scaffold(
        body: Center(child: Text('S.Rocks.Music')),
      ),
    );
  }
}