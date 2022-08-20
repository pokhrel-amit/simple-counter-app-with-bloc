import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_state.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_state.dart';
import 'package:sm_bloc_cubit/constants/enum.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen((internetState) {
    if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Wifi) {
      increment();
    } else if (internetState is InternetConnected &&
        internetState.connectionType == ConnectionType.Mobile) {
      decrement();
    }
  });
  }
  @override
  Future<void> close() {
    internetStreamSubscription?.cancel();
    return super.close();
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
