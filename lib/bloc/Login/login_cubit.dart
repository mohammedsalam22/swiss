import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swis_warehouse/data/Model/login_model.dart';
import 'package:swis_warehouse/data/Repo/login_repo.dart';

part 'login_state.dart';

const storage = FlutterSecureStorage();

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  bool? done;

  Future postLogin(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    done = false;
    try {
      var loginModel = await LoginRepo().login(email, password);
      await storage.write(key: 'token', value: loginModel['token']);
      await storage.write(key: 'id', value: loginModel['id']);
      done = true;
      emit(state.copyWith(
          status: LoginStatus.success,
          loginModel: LoginModel(
              email: loginModel["user"]['email'],
              name: loginModel["user"]['name'],
              token: loginModel["token"])));
    } catch (error) {
      done = false;
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
