import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/Repo/logoutRepo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutState.initial());
  bool? done;

  Future postLogout() async {
    emit(state.copyWith(status: LogoutStatus.loading));
    try {
      var logoutyModel = await LogoutRepo.logout();
      emit(state.copyWith(
        status: LogoutStatus.success,
      ));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LogoutStatus.error));
    }
  }
}