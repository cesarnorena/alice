import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/network_repository.dart';
import 'model/get_network_list.dart';
import 'screens/bloc/network_search_bloc.dart';
import 'screens/network_search_screen.dart';

class NetworkSearchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assetBundle = DefaultAssetBundle.of(context);
    final networkRepository = DefaultNetworkRepository(assetBundle);
    final getNetworkList = GetNetworkList(networkRepository);

    return BlocProvider(
      create: (context) => NetworkSearchBloc(getNetworkList),
      child: NetworkSearchScreen(),
    );
  }
}
