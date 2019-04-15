// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fade/fade.dart';

void main() {
  testWidgets('Initial load uses `visible` correctly',
      (WidgetTester tester) async {
    const key1 = Key('1');
    const key2 = Key('2');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Fade(
                key: key1,
                visible: true,
                child: Container(
                  height: 200,
                ),
              ),
              Fade(
                key: key2,
                visible: false,
                child: Container(
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    ));

    expect(tester.getSize(find.byKey(key1)).height, 200);
    expect(tester.getSize(find.byKey(key2)).height, 0);
  });
}
