import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swis_warehouse/data/Model/login_model.dart';
import 'package:swis_warehouse/data/Repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  bool? done;

  Future postLogin(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var loginModel = await LoginRepo.login(email, password);
      emit(state.copyWith(
        status: LoginStatus.success,
      ));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
