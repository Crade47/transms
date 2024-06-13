import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transms/src/exceptions/app_exceptions.dart';
import 'package:transms/src/exceptions/error_logger.dart';
import 'package:transms/src/models/transms_models.dart';

class MessageReader {
  late SmsQuery _query;
  late ErrorLogger _logger;
  MessageReader() {
    _query = SmsQuery();   
    final container = ProviderContainer();
    _logger = container.read(errorLoggerProvider);
  }


  Future<List<SmsMessage>> getAllSms () async {
    try {
      SmsQuery query = SmsQuery();
      final messages = await query.getAllSms;
      return messages;
    } catch (e, st) {
      _logger.logError(e, st);
      throw ReadException();
    }
  }
}