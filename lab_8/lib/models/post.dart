// models/post.dart
import 'package:json_annotation/json_annotation.dart';
part "post.g.dart"; // Генерируемый файл

@JsonSerializable()
class Posts { 
  final int id;
  final String title;
  final String body;

  Posts ({ 
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => _$PostsFromJson(json);
  Map<String, dynamic> toJson() => _$PostsToJson(this);
}
