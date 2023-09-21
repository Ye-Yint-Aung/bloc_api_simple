import 'package:flutter_bloc_api/service/response_status.dart';

abstract class HttpService{
  Future<ResponseObj> get({required String endUrl,Map<String,dynamic>? params});
 // Future<Map<String,String?>> header();
}