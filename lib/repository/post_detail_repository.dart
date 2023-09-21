import '../service/dio_service.dart';
import '../service/response_status.dart';

class PostDetailRepostitory {
  PostDetailRepostitory();

  final DioHttpService httpService = DioHttpService();

  Future<ResponseObj> getPostById(String postId) async {
    final response = await httpService.get(endUrl: "posts/" + postId);
    print("Respppppp>>>>>>>>>>> $response");
    return response;
  }
}
