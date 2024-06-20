import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transms/src/exceptions/app_exceptions.dart';
import 'package:transms/src/exceptions/error_logger.dart';
import 'package:transms/src/generated/smsproto.pbgrpc.dart' as pb;
import 'package:transms/src/models/transms_models.dart';
import 'package:transms/src/service/grpc_stub.dart';

class MessageReader {
  late SmsQuery _query;
  late ErrorLogger _logger;
  late pb.TransmsClient _stub;
  MessageReader() {
    _query = SmsQuery();   
    final container = ProviderContainer();
    _logger = container.read(errorLoggerProvider);
    _stub = ClientStub().stub;
  }


  Future<List<SmsMessage?>> getTransactions () async {
    try {
      // final messages = await _query.getAllSms;
      pb.SmsRequest request = pb.SmsRequest(); 
      for (var i = 0; i < 5; i++) {
        final message = pb.SmsMessage(
          address: "something", 
          body: "body",
          id: Int64(i),
          lastUpdated: "",
          read: true,
          threadId: Int64(i),
        );
        request.messages.add(message);
      }
      // final validTrans = await Future.wait(messages.map((element) async {
      //   final isValid = await SenderValidator().validateSender(element.address);
      //   return isValid ? element : null;
      // }).toList());

      // final validMessages = validTrans.where((message) => message != null).toList(); 
      // return validMessages;
      await for (var message in _stub.filterSenders(request)){
        debugPrint(message.id.toString());
      }
      return [];
    } catch (e, st) {
      _logger.logError(e, st);
      throw ReadException();
    }
  }
}