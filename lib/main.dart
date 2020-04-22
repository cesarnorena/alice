import 'package:flutter/material.dart';
import 'package:network_search/network_search.dart';

void main() => runApp(AliceApp());

class AliceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetworkSearchScreen(),
    );
  }
}
