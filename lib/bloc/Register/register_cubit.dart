import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swis_warehouse/data/Model/register_api.dart';
import 'package:swis_warehouse/data/Repo/register_repo.dart';

part 'register_state.dart';
const storage = FlutterSecureStorage();

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  Future postRegister(int phone, String name, String type) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      var registerModel = await RegisterRepo().register(phone, name, type);
      await storage.write(key: 'token', value: registerModel['token']);
      await storage.write(key: 'id', value: registerModel['id']);
      emit(state.copyWith(
          status: RegisterStatus.success,
          registerModel: RegisterModel(
              phone: registerModel["user"]['phone'],
              name: registerModel["user"]['name'],
              type: registerModel["token"])));
    } catch (error) {
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
