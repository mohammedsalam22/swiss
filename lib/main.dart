import 'package:flutter/material.dart';
import 'package:swis_warehouse/bloc/ForgetPassword/forget_password_cubit.dart';
import 'package:swis_warehouse/bloc/Login/login_cubit.dart';
import 'package:swis_warehouse/bloc/Register/register_cubit.dart';
import 'package:swis_warehouse/ui/screens/ForgetPassword/forget_password.dart';
import 'app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider(
        create: (context) => ForgetPasswordCubit(),
      ),
    ],
    child: MyApp(
      appRouter: AppRouter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 244, 0, 0),
                ))),
        primaryColor: const Color.fromARGB(255, 244, 0, 0),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
