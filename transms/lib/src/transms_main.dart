import 'package:transms/src/models/transms_models.dart';
import 'package:transms/src/reader/reader.dart';

class Transms {
  Future<List<SmsMessage>> getMessagesWithMoney() async {
    final reader = MessageReader();   
    return await reader.getAllSms();
  }
}