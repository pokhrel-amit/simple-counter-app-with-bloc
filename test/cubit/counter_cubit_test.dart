import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_state.dart';

import 'package:test/test.dart';

void main() {
  group(CounterCubit, (() {
    CounterCubit? counterCubit;
    setUp((() {
      counterCubit = CounterCubit();
    }));

    tearDown((() {
      counterCubit?.close();
    }));

    test('the initial state of CounterCubit is CounterState(counterValue:0)',
        (() {
      expect(counterCubit?.state, CounterState(counterValue: 0));
    }));
    blocTest(
      'the cubit should emit CounterState(counterValue:1,wasIncrement:false) when cubit.increment function is called',
      build: () => CounterCubit(),
      act: (CounterCubit? cubit) => cubit?.increment(),
      expect: () =>
          <CounterState>[CounterState(counterValue: 1, wasIncremented: true)],
    );
  }));
}
