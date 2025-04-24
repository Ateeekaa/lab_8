import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
// ignore: unused_import
import '../models/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => PostPageState();
}

class PostPageState extends State<PostPage> {
  late PostBloc postBloc;

  @override
  void initState() {
    super.initState();
    postBloc = PostBloc();
    postBloc.add(GetPostEvent());
  }

  @override
  void dispose() {
    postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if (state is LoadingPostState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchedPostsState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is FailurePostsState) {
            return Center(child: Text("Ошибка при загрузке постов"));
          }
          return Container();
        },
      ),
    );
  }
}
