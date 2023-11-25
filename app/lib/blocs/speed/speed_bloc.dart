import 'dart:math';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:wob_app/blocs/blocs.dart';

part 'speed_event.dart';
part 'speed_state.dart';

class SpeedBloc extends Bloc<SpeedEvent, SpeedState> {
  late LocationBloc locationBloc;

  SpeedBloc({required this.locationBloc})
      : super(const SpeedState(speed: 0, level: "grey")) {
    on<OnSpeedChange>((event, emit) {
      emit(state.copyWith(level: event.level, speed: event.speed));
    });

    locationBloc.stream.listen((event) {
      final speed = event.speed;
      var level = "grey";

      if (speed == null) return;

      final speedData = (speed * 3600 / 1000 > 0
          ? double.parse((speed * 3600 / 1000).toStringAsFixed(2))
          : 0) as double;

      if (speedData > 40 && speedData < 80) {
        level = "yellow";
      } else if (speedData >= 80) {
        level = "red";
      }

      add(OnSpeedChange(level: level, speed: speedData));
    });
  }
}
