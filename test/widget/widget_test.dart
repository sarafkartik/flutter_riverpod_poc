// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_init/main.dart';
import 'package:riverpod_init/src/domain/random_fact_repository.dart';
import 'package:riverpod_init/src/data/random_fact.dart';
import 'package:riverpod_init/src/network/common/api_response.dart';
import 'package:riverpod_init/src/presentation/ui/random_fact/random_fact_notifier.dart';
import 'package:riverpod_init/src/providers/providers.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([RandomFactRepository])
void main() {
  RandomFactRepository mockRandomFactRepository = MockRandomFactRepository();
  final randomFact = RandomFact(id: '12345', text: "fact");
  const loadFactButtonText = 'Load random fact';
  const delay = 2;

  testWidgets("Test fact screen widgets", (tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      randomFactProvider
          .overrideWith((ref) => RandomFactNotifier(mockRandomFactRepository))
    ], child: const MyApp()));
    final loadFactButtonFinder =
        find.widgetWithText(ElevatedButton, loadFactButtonText);
    expect(loadFactButtonFinder, findsOneWidget);
    when(mockRandomFactRepository.getRandomFact())
        .thenAnswer((realInvocation) async {
      await Future.delayed(const Duration(seconds: delay));
      return Future.value(ApiResponse(success: true, data: randomFact));
    });
    await tester.runAsync(() async {
      await tester.tap(loadFactButtonFinder);
    });
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.runAsync(() async {
      await Future.delayed(const Duration(seconds: delay));
    });
    await tester.pump();
    expect(find.text(randomFact.text!), findsOneWidget);
  });
}
