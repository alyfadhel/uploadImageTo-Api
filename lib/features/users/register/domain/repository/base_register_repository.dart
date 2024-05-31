import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failure.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';
import 'package:image_picker/image_picker.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, RegisterEntities>> getUserRegister(RegisterParameter parameter);
}

class RegisterParameter extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final String location;
  final XFile profilePic;

  const RegisterParameter({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.location,
    required this.profilePic,
  });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    password,
    confirmPassword,
    location,
    profilePic,
  ];
}
