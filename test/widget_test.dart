import 'package:flutter_test/flutter_test.dart';

import 'package:alice/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(AliceApp());
  });
}
