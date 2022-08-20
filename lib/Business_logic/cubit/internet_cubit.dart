import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_state.dart';
import 'package:sm_bloc_cubit/constants/enum.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivitySubsription; 
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivitySubsription =
      connectivity.onConnectivityChanged.listen((result) {
    if (result == ConnectivityResult.mobile) {
      emit(InternetConnected(connectionType: ConnectionType.Mobile));
    } else if (result == ConnectivityResult.wifi) {
      emit(InternetConnected(connectionType: ConnectionType.Wifi));
    } else {
      emit(InternetDisconnected());
    }
  });
  }
  @override
  Future<void> close() {
    connectivitySubsription?.cancel();
    return super.close();
  }
}
