import 'package:flutter_test/flutter_test.dart';

import 'calculator.dart';

void main(){

  setUp(() => null);
  setUpAll(() => null);

  group('Testing the whole', () {
    test('Testing Addition', () {

      // Step 1 - TO GET ACCESS TO THE CLASS, I AM CREATING AN INSTANCE TO IT
      Calculator calculator = Calculator();

      // Step 2 - USING THE INSTANCE TO TEST THE PARTICULAR UNIT

      int result = calculator.add(3, 2);

      // Step 3 - Expecting pass or fail from the particular test case
      expect(result, 5);

      expect(result, (isNot(10)));
    });
    test('Testing Multiplication', () {

      // Step 1 - TO GET ACCESS TO THE CLASS, I AM CREATING AN INSTANCE TO IT
      Calculator calculator = Calculator();

      // Step 2 - USING THE INSTANCE TO TEST THE PARTICULAR UNIT

      int result = calculator.mul(3, 2);

      // Step 3 - Expecting pass or fail from the particular test case
      expect(result, 6);

      expect(result, (isNot(10)));
    });
  });

   tearDown(() => null);
   tearDownAll(() => null);

}