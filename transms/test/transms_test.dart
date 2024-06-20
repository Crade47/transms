
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transms/src/transms_main.dart';

void main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });


  debugPrint('testing');
  test('normal request to the backend', () async {
   final transms = Transms();  
   expect(await transms.getMessagesWithMoney(), []);
  });
}
