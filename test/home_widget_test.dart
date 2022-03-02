// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:coronatracker/screens/home/body_container.dart';
import 'package:coronatracker/widgets/custom_tile.dart';
import 'package:coronatracker/widgets/grid_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home page test', (WidgetTester tester) async {
    final card = find.byType(GridCard);
    final tile = find.byType(CustomTile);
    await tester.pumpWidget(MaterialApp(home: BodyContainer()));

    expect(card, findsNWidgets(4));
    expect(tile, findsNWidgets(7));
  });
}
