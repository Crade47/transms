import 'package:flutter/foundation.dart';
import 'package:transms/src/models/transms_models.dart';
import 'package:transms/src/reader/reader.dart';
import 'package:transms/src/service/smsproto.dart';

class Transms {
  Future<List<SmsMessage?>> getMessagesWithMoney() async {
    final reader = MessageReader();   
    final smsproto = SmsProto();
    final messages = await reader.getAllMessages();
    smsproto.filterTransactionSms(messages).listen((event) {
      debugPrint(event.address);
    });
    return [];
  }
}