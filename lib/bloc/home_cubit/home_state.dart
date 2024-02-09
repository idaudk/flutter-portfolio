part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  double gatesWidth;
  HomeInitial({required this.gatesWidth});
}
final class HomeLoaded extends HomeState {
  double gatesWidth;
  HomeLoaded({required this.gatesWidth});
}

