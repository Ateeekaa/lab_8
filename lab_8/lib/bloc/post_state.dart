part of 'post_bloc.dart';

sealed class PostState extends Equatable {
   const PostState();
   @override
  List<Object> get props => [];
  }

final class PostInitial extends PostState {}

final class LoadingPostState extends PostState {}

final class FetchedPostsState extends PostState {
  final List<Posts> posts;
  const FetchedPostsState(this.posts);
}

final class FailurePostsState extends PostState{} 