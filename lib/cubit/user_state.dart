 import 'package:happy_tech_mastering_api_with_flutter/features/users/register/domain/entities/register_entities.dart';

class UserState {}

 class UserInitial extends UserState {}

 class UserUploadProfileImageState extends UserState{}

 class UserRegisterLoadingState extends UserState{}
 class UserRegisterSuccessState extends UserState{
 final RegisterEntities registerEntities;

  UserRegisterSuccessState(this.registerEntities);
 }
 class UserRegisterErrorState extends UserState{
  // final String error;
  //
  // UserRegisterErrorState(this.error);
 }


