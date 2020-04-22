part of 'network_search_bloc.dart';

@immutable
abstract class NetworkSearchEvent {
  const NetworkSearchEvent();

  Stream<NetworkSearchState> applyAsync({
    NetworkSearchState oldState,
    NetworkSearchBloc bloc,
  });
}
