//
//  Generated code. Do not modify.
//  source: smsproto.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'smsproto.pb.dart' as $0;

export 'smsproto.pb.dart';

@$pb.GrpcServiceName('smsproto.Transms')
class TransmsClient extends $grpc.Client {
  static final _$filterSenders = $grpc.ClientMethod<$0.SmsRequest, $0.SmsMessage>(
      '/smsproto.Transms/FilterSenders',
      ($0.SmsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SmsMessage.fromBuffer(value));

  TransmsClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.SmsMessage> filterSenders($0.SmsRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$filterSenders, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('smsproto.Transms')
abstract class TransmsServiceBase extends $grpc.Service {
  $core.String get $name => 'smsproto.Transms';

  TransmsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SmsRequest, $0.SmsMessage>(
        'FilterSenders',
        filterSenders_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SmsRequest.fromBuffer(value),
        ($0.SmsMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SmsMessage> filterSenders_Pre($grpc.ServiceCall call, $async.Future<$0.SmsRequest> request) async* {
    yield* filterSenders(call, await request);
  }

  $async.Stream<$0.SmsMessage> filterSenders($grpc.ServiceCall call, $0.SmsRequest request);
}
