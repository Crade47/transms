sealed class AppException implements Exception{
  AppException(this.code, this.message);
  final String code;
  final String message;


  @override 
  String toString() => message;
}


class ReadException extends AppException{
  ReadException() : super('read-exception', "Error reading SMS");
}