import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/exception.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failure.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/data/data_source/base_register_remote_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/repository/base_register_repository.dart';

class RegisterRepository extends BaseRegisterRepository
{
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);
  @override
  Future<Either<Failure, RegisterEntities>> getUserRegister(RegisterParameter parameter)async {
    final result = await baseRegisterRemoteDataSource.getRegisterUser(parameter);

    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.statusErrorMessageModel.message));
    }
  }

}