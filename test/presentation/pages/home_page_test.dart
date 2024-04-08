import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'MyHomePage Widget Tests',
    () {
      testWidgets(
        'MyHomePage',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: Text('Hello there'),
              ),
            ),
          );

          expect(find.text('Hello there'), findsOneWidget);
        },
      );
    },
  );
}
