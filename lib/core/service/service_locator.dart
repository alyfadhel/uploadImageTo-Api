import 'package:get_it/get_it.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/network/dio_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/data/data_source/base_register_remote_data_source.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/data/repository/register_repository.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/repository/base_register_repository.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/usecase/get_register_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    sl.registerFactory(()=> UserCubit(sl()));
    sl.registerLazySingleton(()=> GetRegisterUseCase(sl()));
    sl.registerLazySingleton<BaseRegisterRepository>(
            ()=> RegisterRepository(sl()));
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
            ()=> RegisterRemoteDataSource(sl()));
    /////////////////////////////////////////////////////////
    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }
}
