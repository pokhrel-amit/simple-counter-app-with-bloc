import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));
  void increment() => emit(CounterState(counterValue: state.counterValue + 1,wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,wasIncremented: false));
}