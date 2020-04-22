part of 'network_search_bloc.dart';

@immutable
abstract class NetworkSearchEvent {
  const NetworkSearchEvent();

  Stream<NetworkSearchState> applyAsync({
    NetworkSearchState oldState,
    NetworkSearchBloc bloc,
  });
}

class InitEvent extends NetworkSearchEvent {
  const InitEvent();

  @override
  Stream<NetworkSearchState> applyAsync({
    NetworkSearchState oldState,
    NetworkSearchBloc bloc,
  }) async* {
    yield LoadingState();
    final networkList = await bloc.getNetworkList.execute();
    bloc.networkList = networkList;
    yield LoadedState(networkList);
  }
}

class TextChangedEvent extends NetworkSearchEvent {
  const TextChangedEvent(this._text);

  final String _text;

  @override
  Stream<NetworkSearchState> applyAsync({
    NetworkSearchState oldState,
    NetworkSearchBloc bloc,
  }) async* {
    final filteredList = bloc.networkList.where((e) {
      final name = e.name.toLowerCase();
      final filter = _text.toLowerCase();
      return name.contains(filter);
    }).toList();
    yield LoadedState(filteredList);
  }
}
