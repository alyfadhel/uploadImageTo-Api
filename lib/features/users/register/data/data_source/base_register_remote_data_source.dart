import 'package:happy_tech_mastering_api_with_flutter/core/function/upload_image_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/network/dio_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/network/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/data/model/register_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/repository/base_register_repository.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> getRegisterUser(RegisterParameter parameter);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  final DioHelper dioHelper;

  RegisterRemoteDataSource(this.dioHelper);

  @override
  Future<RegisterModel> getRegisterUser(RegisterParameter parameter) async {
    final response = await dioHelper.post(
      endPoint: registerEndPoint,
      isMultipart: true,
      data: {
        'name' : parameter.name,
        'phone' : parameter.phone,
        'email' : parameter.email,
        'password' : parameter.password,
        'confirmPassword' : parameter.confirmPassword,
        'location' : '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
       'profilePic' : await uploadImageToApi(parameter.profilePic),
      },
    );
    return RegisterModel.fromJson(response);
  }
}
