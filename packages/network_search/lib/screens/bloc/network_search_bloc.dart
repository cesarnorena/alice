import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'network_search_event.dart';
part 'network_search_state.dart';

class NetworkSearchBloc extends Bloc<NetworkSearchEvent, NetworkSearchState> {
  @override
  NetworkSearchState get initialState => null;

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
