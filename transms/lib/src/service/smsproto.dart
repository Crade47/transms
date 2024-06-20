import 'package:flutter/foundation.dart';
import 'package:transms/src/generated/smsproto.pb.dart';
import 'package:transms/src/generated/smsproto.pbgrpc.dart';
import 'package:transms/src/service/grpc_stub.dart';

class SmsProto {
  late TransmsClient _stub;
  SmsProto() {
    _stub = ClientStub().stub;
  }

  Stream<SmsMessage> filterTransactionSms(List<SmsMessage> messages) async* {
    final request = SmsRequest(
      messages: messages
    );
    await for(var message in _stub.filterSenders(request)){
      debugPrint(message.address);
      yield message;
    }
  } 
}