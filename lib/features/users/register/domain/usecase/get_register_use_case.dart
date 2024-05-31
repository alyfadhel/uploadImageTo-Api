import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failure.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/usecase/base_usecase.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/repository/base_register_repository.dart';

class GetRegisterUseCase extends BaseUseCase<RegisterEntities,RegisterParameter>
{
  final BaseRegisterRepository baseRegisterRepository;

  GetRegisterUseCase(this.baseRegisterRepository);

  @override
  Future<Either<Failure, RegisterEntities>> call(RegisterParameter parameter)async {
    return await baseRegisterRepository.getUserRegister(parameter);
  }
}