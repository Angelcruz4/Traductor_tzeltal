// This is a basic Flutter widget test.
//
// The test verifies that the main app loads the chat UI and that key
// elements from ChatView are present.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:traductor_tseltal/main.dart';

void main() {
  testWidgets('ChatView smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the chat UI loads correctly.
    expect(find.text('Conversacion voz a voz'), findsOneWidget);
    expect(find.text("K'opojel"), findsOneWidget);
    expect(find.byIcon(Icons.mic), findsOneWidget);
    expect(find.text('Ingresa un Texto'), findsOneWidget);
  });
}