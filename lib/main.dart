import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_search/network_search.dart';
import 'package:network_search/screens/bloc/network_search_bloc.dart';

void main() => runApp(AliceApp());

class AliceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alice',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) => NetworkSearchBloc(),
        child: NetworkSearchScreen(),
      ),
    );
  }
}
