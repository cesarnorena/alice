import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_search/common/widgets/screen.dart';
import 'package:network_search/model/entities/network.dart';
import 'package:network_search/screens/bloc/network_search_bloc.dart';
import 'package:network_search/screens/network_list_widget.dart';

class NetworkSearchScreen extends StatelessWidget {
  const NetworkSearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    networkSearchBloc(context).add(InitEvent());

    return BlocBuilder<NetworkSearchBloc, NetworkSearchState>(
      condition: (oldState, newState) => newState != oldState,
      builder: (bloc, state) {
        final networkList =
            state is LoadedState ? state.networkList : <Network>[];

        return Screen(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  onChanged: (text) {
                    networkSearchBloc(context).add(TextChangedEvent(text));
                  },
                  enabled: state is LoadedState,
                ),
              ),
              Expanded(child: NetworkListWidget(networkList))
            ],
          ),
        );
      },
    );
  }

  NetworkSearchBloc networkSearchBloc(BuildContext context) {
    return BlocProvider.of<NetworkSearchBloc>(context);
  }
}
