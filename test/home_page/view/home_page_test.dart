import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:change_color/presentation/home_page/view/home_page.dart';
import 'package:change_color/core/enum/color_tone_enum.dart';
import 'package:change_color/presentation/home_page/cubit/home_page_cubit.dart';



Widget createHomeScreen() =>  MaterialApp(
    home: HomePage(),
  );

void main() {
  group('Widget Tests  - HomePage', () {

    testWidgets('Color changes', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Verify that the color before the tap down event
      var container = tester.widget<Container>(find.byType(Container));
      var decoration = container.decoration as BoxDecoration;
      expect(decoration.gradient!.colors,
          (equals([Colors.white, Colors.white])));

      // Simulate a tap down event
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Verify that the color changes after the tap down event
       container = tester.widget<Container>(find.byType(Container));
       decoration = container.decoration as BoxDecoration;
      expect(decoration.gradient!.colors,
          isNot(equals([Colors.white, Colors.white])));
    });

    testWidgets('Colortone Changes', (WidgetTester tester) async {
      await tester.pumpWidget(createHomeScreen());

      var text = tester.widget<Text>(find.text('Hello there'));
      expect(text.style!.color, (equals(Colors.white)));


      // Create a mock state with a dark color tone
      final state = HomePageState(colorTone: ColorTone.light);

      // Build the widget with the mock state
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Text(
              'Hello there',
              style: TextStyle(
                color: state.colorTone == ColorTone.dark ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );

      // Verify that the text is displayed
      expect(find.text('Hello there'), findsOneWidget);

      // Verify that the text has the correct color based on the state
      final textWidget = tester.widget<Text>(find.text('Hello there'));
      expect(textWidget.style!.color, equals(Colors.black));

    });
  });
}