part of 'mouse_bloc.dart';

 class MouseState extends Equatable {
  final Offset pointer;
  const MouseState({this.pointer = Offset.zero});

  MouseState copyWith({Offset? pointer}){
    return MouseState(pointer: pointer ?? this.pointer);
  }
  
  @override
  List<Object> get props => [
    pointer
  ];
}

