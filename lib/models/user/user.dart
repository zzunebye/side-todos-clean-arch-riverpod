import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory User({
    required int id,
    required String name,
    required String email,
    required int age,
  }) = _User;


  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}