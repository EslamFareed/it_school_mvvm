import 'package:flutter/material.dart';

import '../../../view_models/home/home_view_model.dart';

class PostsListHome extends StatelessWidget {
  const PostsListHome(this.viewModel, {super.key});
  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = viewModel.posts[index];
        return Card(
          child: ListTile(
            title: Text("${item.title} \n ${item.body}"),
            subtitle: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.comment),
            ),
          ),
        );
      },
      itemCount: viewModel.posts.length,
    );
  }
}
