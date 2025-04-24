// repository/post_repository.dart
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:lab_8/bloc/post_bloc.dart';
import '../models/post.dart';

class PostRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> getPosts( GetPostEvent event , Emitter<PostState> emit ) async {
    emit (LoadingPostState());
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      final List<dynamic> jsonList = jsonDecode(response.body);
      final getPosts = jsonList.map((json) => Posts.fromJson(json)).toList();
      emit(FetchedPostsState(getPosts));
    }
      catch (e) {
        emit (FailurePostsState());
      }
  }
}   