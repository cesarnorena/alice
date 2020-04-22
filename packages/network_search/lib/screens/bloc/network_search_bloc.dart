import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/entities/network.dart';
import '../../model/get_network_list.dart';

part 'network_search_event.dart';
part 'network_search_state.dart';

class NetworkSearchBloc extends Bloc<NetworkSearchEvent, NetworkSearchState> {
  NetworkSearchBloc(this.getNetworkList);

  final GetNetworkList getNetworkList;

  @override
  NetworkSearchState get initialState => InitialState();

  @override
  Stream<NetworkSearchState> mapEventToState(NetworkSearchEvent event) async* {
    try {
      final statesStream = event.applyAsync(oldState: state, bloc: this);
      await for (final state in statesStream) {
        yield state;
      }
    } catch (e) {
      yield state;
    }
  }
}
