// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:share_your_route_front/main.dart';
import 'package:share_your_route_front/route_itinerary_page.dart';
import 'package:share_your_route_front/createRoute2.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MainPage()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('ItinerarioRuta page loads correctly',
      (WidgetTester tester) async {
    // Build ItinerarioRuta widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: RouteItineraryPage()));

    // Verify that the title is displayed.
    expect(find.text('Cotopaxi: Belleza Natural'), findsOneWidget);

    // Verify that the image is displayed.
    expect(find.byType(Image), findsOneWidget);

    // Verify that itinerary items are displayed.
    expect(find.text('Chuquiragua Lodge'), findsOneWidget);
    expect(find.text('Laguna de Limpiopungo'), findsOneWidget);
    expect(find.text('Museo de Arte Moderno'), findsOneWidget);
    expect(find.text('Refugio José Rivas'), findsOneWidget);

    // Verify that the date is displayed.
    expect(find.text('20 de enero del 2024'), findsOneWidget);

    // Verify that the price is displayed.
    expect(find.text('\$75'), findsOneWidget);
    expect(find.text('\$45'), findsOneWidget);

    // Verify that the button is displayed.
    expect(find.text('Comprar paquete'), findsOneWidget);
  });

  testWidgets('CreateRoute2 page loads correctly', (WidgetTester tester) async {
    // Build CreateRoute2 widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: CreateRoute2()));

    // Verify that the title and elements are displayed correctly.
    expect(find.text('Mi Ruta De Cuenca'), findsOneWidget);
    expect(find.text('Crear'), findsOneWidget);
    expect(find.byType(TextField), findsWidgets);
    expect(find.byType(Switch), findsWidgets);
    expect(find.byType(Slider), findsWidgets);
    expect(find.byType(DropdownButton), findsWidgets);
  });
}
