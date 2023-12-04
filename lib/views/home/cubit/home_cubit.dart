import 'package:bloc/bloc.dart';
import 'package:it_school_mvvm/models/post_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();

  Future<List<PostModel>> getPosts() async {
    emit(LoadingPosts());
    List<PostModel> posts = [];

    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");

      if (response.statusCode == 200) {
        for (var element in response.data) {
          posts.add(PostModel.fromJson(element));
        }
        emit(SuccessPosts());
        return posts;
      } else {
        emit(ErrorPosts());
        return [];
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorPosts());
      return [];
    }
  }
}
