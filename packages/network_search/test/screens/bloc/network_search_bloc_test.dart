import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_search/model/entities/network.dart';
import 'package:network_search/model/get_network_list.dart';
import 'package:network_search/model/repositories/network_repository.dart';
import 'package:network_search/screens/bloc/network_search_bloc.dart';

main() {
  NetworkRepository repository;
  NetworkSearchBloc bloc;

  final networkList = [
    Network('1', 'First'),
    Network('2', 'Second'),
    Network('3', 'Third'),
    Network('4', 'Fourth'),
  ];

  setUp(() {
    repository = MockNetworkRepository();
    final getNetworkList = GetNetworkList(repository);
    bloc = NetworkSearchBloc(getNetworkList);
  });

  tearDown(() {
    bloc.close();
  });

  test('Initial state validation', () {
    expect(bloc.initialState, InitialState());
  });

  group('Loading network list', () {
    test('Loading network list success', () async {
      when(
        repository.getNetworkList(),
      ).thenAnswer((_) async => networkList);

      final expected = [
        InitialState(),
        LoadingState(),
        LoadedState(networkList),
      ];

      bloc.add(InitEvent());

      await _emitsExactly(bloc, expected);
    });

    test('Loading network list with error', () async {
      when(
        repository.getNetworkList(),
      ).thenAnswer((_) async => null);

      final expected = [
        InitialState(),
        LoadingState(),
        LoadErrorState(),
      ];

      bloc.add(InitEvent());

      await _emitsExactly(bloc, expected);
    });
  });

  group('Filtering network list', () {
    test('Fitering with match', () async {
      when(
        repository.getNetworkList(),
      ).thenAnswer((_) async => networkList);

      final expected = [
        InitialState(),
        LoadingState(),
        LoadedState(networkList),
        LoadedState([networkList[0], networkList[3]]),
      ];

      bloc.add(InitEvent());
      bloc.add(TextChangedEvent('f'));

      await _emitsExactly(bloc, expected);
    });

    test('Fitering without match', () async {
      when(
        repository.getNetworkList(),
      ).thenAnswer((_) async => networkList);

      final expected = [
        InitialState(),
        LoadingState(),
        LoadedState(networkList),
        LoadedState([]),
      ];

      bloc.add(InitEvent());
      bloc.add(TextChangedEvent('z'));

      await _emitsExactly(bloc, expected);
    });
  });
}

class MockNetworkRepository extends Mock implements NetworkRepository {}

Future<void> _emitsExactly(
  NetworkSearchBloc bloc,
  List<NetworkSearchState> states,
) {
  return emitsExactly<NetworkSearchBloc, NetworkSearchState>(bloc, states);
}
