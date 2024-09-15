import 'package:flutter/material.dart';
import 'package:swis_warehouse/bloc/ForgetPassword/forget_password_cubit.dart';
import 'package:swis_warehouse/bloc/Home/home_cubit.dart';
import 'package:swis_warehouse/bloc/Inventory/inventory_cubit.dart';
import 'package:swis_warehouse/bloc/Login/login_cubit.dart';
import 'package:swis_warehouse/bloc/Material/material_cubit.dart';
import 'package:swis_warehouse/bloc/Profile/profile_cubit.dart';
import 'package:swis_warehouse/bloc/Register/register_cubit.dart';
import 'package:swis_warehouse/bloc/TransictionStatus/transiction_status_cubit.dart';
import 'package:swis_warehouse/bloc/details_cubit/details_cubit.dart';
import 'package:swis_warehouse/bloc/donorhome/donor_home_cubit.dart';
import 'package:swis_warehouse/bloc/warrent_cubit/warrent_cubit.dart';
import 'package:swis_warehouse/ui/screens/ForgetPassword/forget_password.dart';
import 'package:swis_warehouse/ui/screens/LabelStatus/status_view.dart';
import 'app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/Transiction_info/transiction_info_cubit.dart';

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
        BlocProvider(
          create: (context) => ProducCubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => TransictionStatusCubit(),
        ),
        BlocProvider(
          create: (context) => InventoryCubit(),
        ),
        BlocProvider(
          create: (context) => TransictionInfoCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => WarrentCubit(),
        ),
        BlocProvider(
          create: (context) => DonorHomeCubit(),
        ),
      ],
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
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
