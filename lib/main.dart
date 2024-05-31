import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/service/service_locator.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/sign_in_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<UserCubit>(),
      child: BlocConsumer<UserCubit,UserState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignInScreen(),
          );
        },
      ),
    );
  }
}
