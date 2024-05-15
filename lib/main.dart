import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.red),
        inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromARGB(255, 244, 0, 0) ,
            )
          )
        ),
        primaryColor: const Color.fromARGB(255, 244, 0, 0),
      ),
    debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}