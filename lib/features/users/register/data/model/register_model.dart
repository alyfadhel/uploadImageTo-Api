import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';

class RegisterModel extends RegisterEntities {
  const RegisterModel({
    required super.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'],
    );
  }
}
