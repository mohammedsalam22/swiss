import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swis_warehouse/data/Model/register_api.dart';
import 'package:swis_warehouse/data/Repo/register_repo.dart';

part 'register_state.dart';
const storage = FlutterSecureStorage();

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  Future postRegister(String name,String phone,String password,String password_confirmation) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      var registerModel = await RegisterRepo().register(name, phone,password, password_confirmation);

      emit(state.copyWith(
          status: RegisterStatus.success,
          ));
    } catch (error) {
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
