import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_search/data/network_repository.dart';
import 'package:network_search/model/get_network_list.dart';
import 'package:network_search/screens/bloc/network_search_bloc.dart';
import 'package:network_search/screens/network_list_widget.dart';
import 'package:network_search/screens/network_search_screen.dart';

void main() {
  LiveTestWidgetsFlutterBinding();

  AssetBundle assetBundle;
  NetworkSearchBloc bloc;
  Widget screen;

  String json = '[' +
      '{"id": "1", "name": "first"},' +
      '{"id": "2", "name": "second"},' +
      '{"id": "3", "name": "thir"},' +
      '{"id": "4", "name": "fourth"}' +
      ']';

  setUp(() {
    assetBundle = MockAssetBundle();
    final repository = DefaultNetworkRepository(assetBundle);
    // final repository = MockNetworkRepository();
    final getNetworkList = GetNetworkList(repository);
    bloc = NetworkSearchBloc(getNetworkList);
    screen = _createWidget(bloc);
  });

  testWidgets('Initial state validation', (tester) async {
    await _startWidget(tester, screen);

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Loading network list success', (tester) async {
    when(
      assetBundle.loadString(any),
    ).thenAnswer((_) async => json);

    await _startWidget(tester, screen);

    expect(find.byType(NetworkItem), findsNWidgets(4));
  });

  group('Filtering network list', () {
    testWidgets('Filtering network list with match', (tester) async {
      when(
        assetBundle.loadString(any),
      ).thenAnswer((_) async => json);

      await _startWidget(tester, screen);
      await tester.enterText(find.byType(TextField), 't');
      await tester.pumpAndSettle();

      expect(find.byType(NetworkItem), findsNWidgets(3));
    });

    testWidgets('Filtering network list without match', (tester) async {
      when(
        assetBundle.loadString(any),
      ).thenAnswer((_) async => json);

      await _startWidget(tester, screen);
      await tester.enterText(find.byType(TextField), 'a');
      await tester.pumpAndSettle();

      expect(find.byType(NetworkItem), findsNothing);
    });
  });
}

class MockAssetBundle extends Mock implements AssetBundle {}

Widget _createWidget(
  NetworkSearchBloc bloc,
) {
  return MaterialApp(
    home: BlocProvider(
      create: (context) => bloc,
      child: NetworkSearchScreen(),
    ),
  );
}

Future<void> _startWidget(
  WidgetTester tester,
  Widget widget,
) async {
  await tester.pumpWidget(widget);
  // Skip frame so the streams can start to emit (initially is empty)
  await tester.pump(Duration.zero);
}
