import 'package:flutter/material.dart';
import 'package:it_school_mvvm/models/post_model.dart';
import 'package:it_school_mvvm/views/home/cubit/home_cubit.dart';

class HomeViewModel {
  // Data
  List<PostModel> posts = [];

  // Functions
  void getPosts(BuildContext context) async {
    posts = await HomeCubit.get(context).getPosts();
  }
}
