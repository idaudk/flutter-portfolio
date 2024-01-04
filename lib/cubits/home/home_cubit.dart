import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(gatesWidth: ScreenUtil().screenWidth / 2)) {
    gatesHandler();
  }

  gatesHandler() {
    Future.delayed(const Duration(seconds: 2), () {
      emit(HomeLoaded(gatesWidth: 0));
    });
  }
}
