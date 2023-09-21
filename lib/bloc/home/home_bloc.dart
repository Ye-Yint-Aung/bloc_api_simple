import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api/service/response_status.dart';

import '../../model/post.dart';
import '../../repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetHomeEvent>(getHomeEvent);
  }

  final homeRepository = HomeRepository();

  void getHomeEvent(GetHomeEvent event, emit) async {
    emit(HomeLoadingState());
    final response = await homeRepository.getPost();

    if (response.apiStatus == ApiStatus.loading) {
      emit(HomeLoadingState());
    } else if (response.apiStatus == ApiStatus.success) {
      List<dynamic> responseList = response.data;
      List<Post> postData = responseList.map((e) => Post.fromJson(e)).toList();
      print("Response data in home bloc : ${responseList.runtimeType}");
      print("Response data in home bloc : ${postData[0].title}");
      emit(HomeSuccessState(post: postData));
    } else if (response.apiStatus == ApiStatus.failure) {
      emit(HomeErrorState(errorMessage: "Error"));
    }
  }

// void getPostById(GetPostById event, emit) async {
//   String postId;
//   emit(HomeLoadingState());
//   final response = await homeRepository.getPostById();
// }
}
