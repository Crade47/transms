//
//  Generated code. Do not modify.
//  source: smsproto.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use smsMessageDescriptor instead')
const SmsMessage$json = {
  '1': 'SmsMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'threadId', '3': 2, '4': 1, '5': 3, '10': 'threadId'},
    {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    {'1': 'read', '3': 5, '4': 1, '5': 8, '10': 'read'},
    {'1': 'last_updated', '3': 6, '4': 1, '5': 9, '10': 'lastUpdated'},
  ],
};

/// Descriptor for `SmsMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smsMessageDescriptor = $convert.base64Decode(
    'CgpTbXNNZXNzYWdlEg4KAmlkGAEgASgDUgJpZBIaCgh0aHJlYWRJZBgCIAEoA1IIdGhyZWFkSW'
    'QSGAoHYWRkcmVzcxgDIAEoCVIHYWRkcmVzcxISCgRib2R5GAQgASgJUgRib2R5EhIKBHJlYWQY'
    'BSABKAhSBHJlYWQSIQoMbGFzdF91cGRhdGVkGAYgASgJUgtsYXN0VXBkYXRlZA==');

@$core.Deprecated('Use smsRequestDescriptor instead')
const SmsRequest$json = {
  '1': 'SmsRequest',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.smsproto.SmsMessage', '10': 'messages'},
  ],
};

/// Descriptor for `SmsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smsRequestDescriptor = $convert.base64Decode(
    'CgpTbXNSZXF1ZXN0EjAKCG1lc3NhZ2VzGAEgAygLMhQuc21zcHJvdG8uU21zTWVzc2FnZVIIbW'
    'Vzc2FnZXM=');

