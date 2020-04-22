import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/entities/network.dart';
import 'bloc/network_search_bloc.dart';
import 'network_list_widget.dart';

class NetworkSearchScreen extends StatelessWidget {
  const NetworkSearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    networkSearchBloc(context).add(InitEvent());

    return BlocBuilder<NetworkSearchBloc, NetworkSearchState>(
      condition: (oldState, newState) => newState != newState,
      builder: (bloc, state) {
        List<Network> networkList = [];

        if (state is LoadedState) {
          networkList = state.networkList;
        }

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    onChanged: (text) {
                      networkSearchBloc(context).add(TextChangedEvent(text));
                    },
                    enabled: state is InitialState ? false : true,
                  ),
                ),
                Expanded(
                  child: NetworkListWidget(networkList),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  NetworkSearchBloc networkSearchBloc(BuildContext context) {
    return BlocProvider.of<NetworkSearchBloc>(context);
  }
}
