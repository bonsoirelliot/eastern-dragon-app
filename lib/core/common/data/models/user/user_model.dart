import 'package:eastern_dragon/core/common/data/exceptions/response_parse_exception.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)

/// Сущность пользователя
class UserModel {
  /// id
  final int id;

  /// Адрес почты
  final String? email;

  /// Имя пользователя
  final String? name;

  // TODO(Nikita): подумать, надо ли добавить еще поля

  UserModel({
    required this.id,
    this.email,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$UserModelFromJson(json);
    } on Object catch (e) {
      throw ResponseParseException('UserModel: $e');
    }
  }

  UserModel copyWith({
    String? email,
    String? name,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
