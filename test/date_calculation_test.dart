import 'package:flutter_test/flutter_test.dart';
import 'package:test_poc/Functions/date_calculation.dart';

void main(){
   late Date date;
  setUpAll(() {
    date = Date();
  });
group('testing in every scenarios', () {
  test('The correct date calculation', (){
    int today = date.noOfDaysInMonth('JUNE');
    expect(today, 30);
  });
});

}
