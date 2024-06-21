import 'package:grpc/grpc.dart';
import 'package:transms/src/generated/smsproto.pbgrpc.dart';


class ClientStub {

  final _channel = ClientChannel('127.0.0.1',
      port: 7890,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure())
    );

  TransmsClient get stub {
    return TransmsClient(_channel,
    options: CallOptions(timeout: Duration(seconds: 30))
    );
  } 
}


