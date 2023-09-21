part of 'post_detail_cubit.dart';

abstract class PostDetailState extends Equatable {}

class PostDetailInitialState extends PostDetailState {
  @override
  List<Object> get props => [];
}

class PostDetailLoadingState extends PostDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostDetailSuccessState extends PostDetailState {
  Post postById;

  PostDetailSuccessState({required this.postById});

  @override
  // TODO: implement props
  List<Object?> get props => [postById];
}

class PostDetailErrorState extends PostDetailState {
  String errorMessage;

  PostDetailErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
