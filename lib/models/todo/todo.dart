import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  // @Assert('title.isNotEmpty', 'title cannot be empty')
  const factory Todo({
    required String title,
    required String description,
    required DateTime createdAt,
    required DateTime modifiedAt,
    required DateTime startDate,
    required DateTime endDate,
    @Default(false) bool done,
  }) = _Todo;

  factory Todo.fromJson(Map <String, dynamic> json)
  => _$TodoFromJson(json);
}
