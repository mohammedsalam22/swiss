import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Model/forget_password.dart';
import 'package:swis_warehouse/data/Repo/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordState.initial());

  Future forgetpassword(String email) async {
    emit(state.copyWith(status: ForgetPasswordStatus.loading));
    try {
      var forgetPasswordModel = await ForgetPasswordRepo().forget(email);
      emit(state.copyWith(
          status: ForgetPasswordStatus.success,
          forgetPasswordModel: ForgetPasswordModel(
            email: forgetPasswordModel["user"]['email'],
          )));
    } catch (error) {
      emit(state.copyWith(status: ForgetPasswordStatus.error));
    }
  }
}

class RetrivePasswordCubit extends Cubit<RetrivePasswordState> {
  RetrivePasswordCubit() : super(RetrivePasswordState.initial());

  Future retrivepassword(int code) async {
    emit(state.copyWith(status: RetrivePasswordStatus.loading));
    try {
      var retrivePasswordModel = await RetrivePasswordRepo().retrive(code);
      emit(state.copyWith(
          status: RetrivePasswordStatus.success,
          retrivePasswordModel: RetrivePasswordModel(
            code: retrivePasswordModel["user"]['code'],
          )));
    } catch (error) {
      emit(state.copyWith(status: RetrivePasswordStatus.error));
    }
  }
}
