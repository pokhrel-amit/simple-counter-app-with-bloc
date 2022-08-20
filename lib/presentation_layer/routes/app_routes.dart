import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_cubit.dart';
import 'package:sm_bloc_cubit/main.dart';
import 'package:sm_bloc_cubit/presentation_layer/screens/home_screen.dart';
import 'package:sm_bloc_cubit/presentation_layer/screens/second_screen.dart';
import 'package:sm_bloc_cubit/presentation_layer/screens/third_screen.dart';

class AppRoutes {

  

  final CounterCubit counterCubit = CounterCubit(
    internetCubit: InternetCubit(
      connectivity: Connectivity(),
    ),
  );
  Route generateRoutes(RouteSettings settings) {
    // final GlobalKey<ScaffoldState>? key =
    //     settings.arguments as GlobalKey<ScaffoldState>;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: ((_) => BlocProvider.value(
                value: counterCubit,
                child: HomeScreen(),
              )),
        );
      case '/second':
        return MaterialPageRoute(
          builder: ((_) => BlocProvider.value(
                value: counterCubit,
                child: SecondScreen(),
              )),
        );
      case '/third':
        return MaterialPageRoute(
          builder: ((_) => BlocProvider.value(
                value: counterCubit,
                child: ThirdScreen(),
              )),
        );
      default:
        return MaterialPageRoute(
          builder: ((_) => BlocProvider.value(
                value: counterCubit,
                child: HomeScreen(),
              )),
        );
    }
  }

  void dispose() {
    counterCubit.close();
  }
}
