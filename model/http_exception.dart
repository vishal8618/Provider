class HttpException implements Exception
{
  final String msg;
  HttpException(this.msg);

  @override
  String toString() {

   // return super.toString(); Instance of exception
   return msg;
  }
}