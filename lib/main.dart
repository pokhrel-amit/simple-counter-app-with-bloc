import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_cubit.dart';
import 'package:sm_bloc_cubit/presentation_layer/routes/app_routes.dart';
import 'package:sm_bloc_cubit/presentation_layer/screens/home_screen.dart';

import 'Business_logic/cubit/counter_cubit.dart';

void main(List<String> args) async {
    WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        connectivity: Connectivity(),
      ),
    ),
    storage: storage,
  );

  // final storage = await HydratedStorage.build();
// HydratedBlocOverrides.runZoned(
//   () => runApp(MyApp()),
//   storage: storage,
// );)
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoutes,
        initialRoute: '/',
      ),
    );
  }
}
