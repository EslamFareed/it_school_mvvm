import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_school_mvvm/shared/cubit/main_cubit.dart';
import 'package:it_school_mvvm/view_models/home/home_view_model.dart';
import 'package:it_school_mvvm/views/home/cubit/home_cubit.dart';

import 'components/posts_list_home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getPosts(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Switch(
                value: MainCubit.get(context).isDark,
                onChanged: (value) {
                  MainCubit.get(context).changeTheme(value);
                },
              );
            },
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is LoadingPosts) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorPosts) {
            return const Center(
              child: Text("error"),
            );
          }
          return PostsListHome(viewModel);
        },
      ),
    );
  }
}
