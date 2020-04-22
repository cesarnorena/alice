part of 'network_search_bloc.dart';

@immutable
abstract class NetworkSearchState extends Equatable {
  const NetworkSearchState();

  @override
  List<Object> get props => [];
}

class InitialState extends NetworkSearchState {
  const InitialState();
}

class LoadingState extends NetworkSearchState {
  const LoadingState();
}

class LoadedState extends NetworkSearchState {
  LoadedState(this.networkList);

  final List<Network> networkList;

  @override
  List<Object> get props => [networkList];
}
