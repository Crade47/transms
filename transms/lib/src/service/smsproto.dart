import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:transms/src/generated/smsproto.pb.dart';
import 'package:transms/src/generated/smsproto.pbgrpc.dart';
import 'package:transms/src/service/grpc_stub.dart';

class SmsProto {
  late TransmsClient _stub;
  SmsProto() {
    _stub = ClientStub().stub;
  }

  Stream<SmsMessage> filterTransactionSms(List<SmsMessage> messages) {
    final request = SmsRequest(
      messages: messages
    );
    final controller = StreamController<SmsMessage>.broadcast();


    () async{
      await for(var message in _stub.filterSenders(request)){
        debugPrint(message.toDebugString());
        controller.add(message);
      }
      await controller.close();
    }();
    return controller.stream;
  } 
}