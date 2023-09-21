import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/repository/post_detail_repository.dart';
import 'package:flutter_bloc_api/service/response_status.dart';

import '../../model/post.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(PostDetailInitialState());
  final PostDetailRepostitory _detailRepostitory = PostDetailRepostitory();

  void getPostById(String id) async {
    emit(PostDetailLoadingState());
    final response = await _detailRepostitory.getPostById(id);

    if (response.apiStatus == ApiStatus.success) {
      Post postData = Post.fromJson(response.data);
      print("Post Detail Success: ${postData.title} ");
      emit(PostDetailSuccessState(postById: postData));
    } else if (response.apiStatus == ApiStatus.failure) {
      print("Post Detail Error");
      emit(PostDetailErrorState(errorMessage: "Error"));
    }
  }
}
