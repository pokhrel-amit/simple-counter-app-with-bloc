import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CounterState extends Equatable {
  final counterValue;
  final wasIncremented;
  CounterState({required this.counterValue, this.wasIncremented});

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.wasIncremented];

  factory CounterState.fromMap(Map<String, dynamic> map) {
    // if (map == Null) return CounterState(counterValue: null);

    return CounterState(
        counterValue: map['counterValue'],
        wasIncremented: map['wasIncremented']);
  }

  factory CounterState.fromJson(String json) {
    return CounterState.fromMap(jsonDecode(json));
  }

  String toJson() => jsonEncode(tomap());

  Map<String, dynamic> tomap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }
}
