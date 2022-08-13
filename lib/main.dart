import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/presentation_layer/routes/app_routes.dart';
import 'package:sm_bloc_cubit/presentation_layer/screens/home_screen.dart';

import 'Business_logic/cubit/counter_cubit.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRoutes appRoutes = AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRoutes,
      initialRoute: '/',
    );
  }

  @override
  void dispose() {
    appRoutes.dispose();
    super.dispose();
  }
}
