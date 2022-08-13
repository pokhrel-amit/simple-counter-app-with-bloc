import 'dart:developer';

import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final counterValue;
  final wasIncremented;
  CounterState({ required this.counterValue,this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue,this.wasIncremented];
}