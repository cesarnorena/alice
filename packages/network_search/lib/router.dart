import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/bloc/network_search_bloc.dart';
import 'screens/network_search_screen.dart';

class NetworkSearchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkSearchBloc(),
      child: NetworkSearchScreen(),
    );
  }
}
