import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/repository/base_register_repository.dart';
import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/usecase/get_register_use_case.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this.getRegisterUseCase,
  ) : super(UserInitial());
  GetRegisterUseCase getRegisterUseCase;

  static UserCubit get(context) => BlocProvider.of(context);

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Profile Pic
  XFile? profilePic;

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  void uploadImageProfile(XFile image) {
    profilePic = image;
    emit(UserUploadProfileImageState());
  }

  RegisterEntities? registerEntities;
  void signUpUser() async {
    emit(UserRegisterLoadingState());
    final result = await getRegisterUseCase(
      RegisterParameter(
        name: signUpName.text,
        phone: signUpPhoneNumber.text,
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: confirmPassword.text,
        location:
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        profilePic: profilePic!,
      ),
    );
    result.fold(
      (l) {
        emit(UserRegisterErrorState());
      },
      (r) {
        registerEntities = r;
        emit(UserRegisterSuccessState(r));
      },
    );
  }
}
