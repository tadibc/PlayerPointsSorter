import 'package:flutter/material.dart';
import 'package:point_sorter/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar:
            AppBar(
                centerTitle: true,
                title: const Text('Player Score Serializer')
            ),
            body: Home()));
  }
}