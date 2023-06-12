
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_poc/Screens/home_screen.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('When we enter invalid input', (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: HomePage(),));

    await Future.delayed(const Duration(seconds: 2));

    const testText = 'test';

    await Future.delayed(const Duration(seconds: 2));
    await tester.enterText(find.byKey(Key('text_feild')), testText);

    await tester.tap(find.widgetWithText(ElevatedButton, "Check"));
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));

    expect(find.text('Invalid input! Please enter a valid month.'), findsOneWidget);
    expect(find.text(testText), findsOneWidget);



  });

  testWidgets('When we enter a valid input in the text field', (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: HomePage(),));
    await Future.delayed(const Duration(seconds: 2));


    final inputText = 'JANUARY';
    await tester.enterText(find.byKey(Key("text_feild")), inputText);
    await Future.delayed(const Duration(seconds: 2));

    await tester.tap(find.widgetWithText(ElevatedButton, "Check"));
    await Future.delayed(const Duration(seconds: 2));

    await tester.pumpAndSettle();

    expect(find.text('No. of days in JANUARY - 31'), findsOneWidget);
    expect(find.text(inputText), findsOneWidget);
  });

  testWidgets('To clear the text filed', (WidgetTester tester)async{
    await tester.pumpWidget(MaterialApp(home: HomePage(),));
    await Future.delayed(const Duration(seconds: 2));

    await tester.enterText(find.byKey(Key("text_feild")), '');

    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Clear'));
    await Future.delayed(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text(''), findsOneWidget);
  });


}