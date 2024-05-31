import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failure.dart';

abstract class BaseUseCase<T,Parameter>
{
  Future<Either<Failure,T>>call(Parameter parameter);
}

class NoParameters extends Equatable
{
  const NoParameters();
  @override
  List<Object?> get props => [];

}