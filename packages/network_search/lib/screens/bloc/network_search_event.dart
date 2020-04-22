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
    yield LoadedState(networkList);
  }
}
