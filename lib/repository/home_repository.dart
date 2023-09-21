import 'package:flutter_bloc_api/service/response_status.dart';

import '../service/dio_service.dart';

class HomeRepository {
  HomeRepository();

  final DioHttpService httpService = DioHttpService();

  Future<ResponseObj> getPost() async {
    final response = await httpService.get(endUrl: "posts");
    return response;
  }

  Future<ResponseObj> getPostById(String postId) async {
    final response = await httpService.get(endUrl: "posts" + postId);
    return response;
  }


}
