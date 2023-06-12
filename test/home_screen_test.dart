import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_poc/Screens/home_screen.dart';

void main(){
  testWidgets('This will test the widgets of the text-field, button and text item.', (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(
        home: HomePage()));

    //Creating finders -
    final titleFinder = find.text('Unit Testing');
    final textFieldFinder = find.byType(TextField);
    final checkButtonFinder = find.widgetWithText(ElevatedButton, "Check");
    final clearButtonFinder = find.widgetWithText(ElevatedButton, "Clear");
    // final initialText = find.text('No. of days in - 0');

    await tester.enterText(textFieldFinder,"JUNE");

    await tester.pumpAndSettle(Duration(milliseconds: 1000));
    await tester.tap(checkButtonFinder);
    await Future.delayed(const Duration(seconds: 2));
    await tester.pump();
    final updatedTextItemFinder = find.text('No. of days in JUNE - 30');
    await Future.delayed(const Duration(seconds: 2));
    expect(updatedTextItemFinder, findsOneWidget);

    // expect statements
    expect(titleFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    expect(checkButtonFinder, findsOneWidget);
    expect(clearButtonFinder, findsOneWidget);
    // expect(initialText, findsOneWidget);


  });

}
