part of 'mouse_bloc.dart';

sealed class MouseEvent extends Equatable {
  const MouseEvent();

  @override
  List<Object> get props => [];
}

class MouseMoveEvent extends MouseEvent{
  Offset pointer;
  MouseMoveEvent({required this.pointer});

  @override
  List<Object> get props => [pointer];
}
