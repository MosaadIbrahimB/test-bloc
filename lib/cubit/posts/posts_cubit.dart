import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class PostsCubit extends Cubit<PostStat> {
  PostsCubit() : super(InitPostsState());

  fetchData() async {
    emit(LoadingPostsState());
    try {
      var response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts",
      );
      List<dynamic> posts = response.data;
      emit(SucceedPostsState(post: posts));
    } catch (e) {
      emit(ErrorPostsState(message: e.toString()));
    }
  }
}

abstract class PostStat {}

class InitPostsState extends PostStat {}

class LoadingPostsState extends PostStat {}

class SucceedPostsState extends PostStat {
  final List<dynamic> post;

  SucceedPostsState({required this.post});
}

class ErrorPostsState extends PostStat {
  final String message;

  ErrorPostsState({required this.message});
}
