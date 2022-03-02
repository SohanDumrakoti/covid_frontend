import 'package:coronatracker/drawer/navdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home page test', (WidgetTester tester) async {
    final text = find.byType(Text);
    final avtar = find.byType(CircleAvatar);
    final tile = find.byType(ListTile);
    await tester.pumpWidget(MaterialApp(home: NavDrawer()));

    expect(text, findsNWidgets(2));
    expect(tile, findsNWidgets(4));
    expect(avtar, findsOneWidget);
  });
}
