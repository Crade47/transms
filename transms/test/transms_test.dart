
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transms/src/generated/smsproto.pb.dart';
import 'package:transms/src/service/smsproto.dart';
import 'package:transms/src/transms_main.dart';

void main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });

  final dummySmsMessages = [
    SmsMessage(
      id: Int64(1),
      threadId: Int64(101),
      address: "VK-MAHABK",
      body: "Hello, this is the first message",
      read: true,
      lastUpdated: DateTime.now().toIso8601String(),
    ),
    SmsMessage(
      id: Int64(2),
      threadId: Int64(102),
      address: "0987654321",
      body: "Hello, this is the second message",
      read: false,
      lastUpdated: DateTime.now().toIso8601String(),
    ),
    SmsMessage(
      id: Int64(3),
      threadId: Int64(103),
      address: "1112223333",
      body: "Hello, this is the third message",
      read: true,
      lastUpdated: DateTime.now().toIso8601String(),
    ),
    SmsMessage(
      id: Int64(4),
      threadId: Int64(104),
      address: "VK-MAHABK",
      body: "Hello, this is the fourth message",
      read: false,
      lastUpdated: DateTime.now().toIso8601String(),
    ),
    SmsMessage(
      id: Int64(5),
      threadId: Int64(105),
      address: "VK-MAHABK",
      body: "Hello, this is the fifth message",
      read: true,
      lastUpdated: DateTime.now().toIso8601String(),
    ),
  ];


  test('normal request to the backend', () async {
   final transms = Transms();  
   expect(await transms.getMessagesWithMoney(), []);
  });


  test('filter sms', () async{
    debugPrint('testing filter testcase');
    final smsProto = SmsProto();
    final stream = smsProto.filterTransactionSms(dummySmsMessages);
    stream.listen((event) {
      debugPrint('Transaction processed');
    });
  });
}
