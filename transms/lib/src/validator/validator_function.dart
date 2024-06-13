import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:transms/src/validator/validator.dart';

class SenderValidator {
  SenderValidator();

  Future<bool> validateSender(String? senderId) async {
    if(senderId == null){
      return false;
    }
    if (senderId.length != 9) {
      return false;
    }

    List<String> seperated = senderId.split('-');

    debugPrint("In the validator parent function");
    final result = await Future.wait([
      Isolate.run(() => _validatePrefix(seperated[0])),
      Isolate.run(() => _validateBankId(seperated[1]))
    ]);
    final validPrefix = result[0]; 
    final validBank = result[1];
    return validBank && validPrefix;

  }


  bool _validatePrefix(String prefix) {
    debugPrint('In the validate Prefix function with prefix $prefix');
    final split = prefix.split('');
    final validOp = operatorPrefix.containsKey(split[0]);
    final validCircle = circleName.containsKey(split[1]);
    if(validOp && validCircle){
      return true;
    }
    return false;
  }

  bool _validateBankId(String id) {
    debugPrint('In the validate bank function with bank $id');
    return bankNameCode.containsValue(id);
  }
}
