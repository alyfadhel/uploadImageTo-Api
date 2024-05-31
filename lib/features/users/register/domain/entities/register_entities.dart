import 'package:equatable/equatable.dart';

class RegisterEntities extends Equatable {
  final String message;

  const RegisterEntities({
    required this.message,
  });

  @override
  List<Object?> get props => [
    message,
  ];
}
