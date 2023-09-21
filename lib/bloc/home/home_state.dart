part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  //Post? post;
  List<Post> post;

  HomeSuccessState({required this.post});

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

class HomeErrorState extends HomeState {
  String errorMessage;

  HomeErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
