import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/counter_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_cubit.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_state.dart';
import 'package:sm_bloc_cubit/constants/enum.dart';

import '../../Business_logic/cubit/counter_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        } else {
          CircularProgressIndicator();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return Text('Wifi');
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return Text('Mobile');
                    } else if (state is InternetDisconnected) {
                      return Text('Disconnected');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    BlocConsumer<CounterCubit, CounterState>(
                      builder: (context, state) {
                        return Text(state.counterValue.toString());
                      },
                      listener: (context, state) {
                        if (state.wasIncremented) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Incremented'),
                              duration: Duration(milliseconds: 300),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Decremented'),
                              duration: Duration(milliseconds: 300),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: const Text(
                    'Second Page',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/third');
                  },
                  child: const Text(
                    'Third Page',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
