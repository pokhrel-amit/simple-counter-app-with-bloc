import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_state.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_state.dart';
import 'package:sm_bloc_cubit/constants/enum.dart';

class CounterCubit extends Cubit<CounterState>  with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
   CounterState fromJson(Map<String, dynamic> map) {
   return CounterState.fromMap(map);
  }

  @override
  Map<String, dynamic>? toJson(state) {
   return state.tomap();
  }
}
