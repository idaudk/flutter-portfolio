import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'mouse_event.dart';
part 'mouse_state.dart';

class MouseBloc extends Bloc<MouseEvent, MouseState> {
  MouseBloc() : super(const MouseState()) {
    on<MouseMoveEvent>(mouseMoveEvent);
  }

  FutureOr<void> mouseMoveEvent(
      MouseMoveEvent event, Emitter<MouseState> emit) {
    emit(state.copyWith(pointer: event.pointer));
  }
}
