import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sm_bloc_cubit/Business_logic/cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit():super(InternetLoading());
}