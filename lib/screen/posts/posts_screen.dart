import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio/cubit/posts/posts_cubit.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PostsCubit()..fetchData(),
        child: BodyPosts(),
      ),
    );
  }
}

class BodyPosts extends StatelessWidget {
  const BodyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit,PostStat>(
      builder: (context, state) {
        if (state is LoadingPostsState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SucceedPostsState) {
          List data = state.post;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) =>ListTile(
              title: Text("${data[index]["id"]}"),
              subtitle: Text("${data[index]["title"]}"),
            ) ,

          );
        }
        if (state is ErrorPostsState) {
          return Center(child: Text(state.message));
        }


        return Center(child: Text("No Data ....."));
      },
    );
  }
}
