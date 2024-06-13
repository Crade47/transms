import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transms/src/exceptions/app_exceptions.dart';
import 'package:transms/src/exceptions/error_logger.dart';
import 'package:transms/src/models/transms_models.dart';
import 'package:transms/src/validator/validator.dart';

class MessageReader {
  late SmsQuery _query;
  late ErrorLogger _logger;
  MessageReader() {
    _query = SmsQuery();   
    final container = ProviderContainer();
    _logger = container.read(errorLoggerProvider);
  }


  Future<List<SmsMessage?>> getTransactions () async {
    try {
      final messages = await _query.getAllSms;
      final validTrans = await Future.wait(messages.map((element) async {
        final isValid = await SenderValidator().validateSender(element.address);
        return isValid ? element : null;
      }).toList());

      final validMessages = validTrans.where((message) => message != null).toList(); 
      return validMessages;
    } catch (e, st) {
      _logger.logError(e, st);
      throw ReadException();
    }
  }
}