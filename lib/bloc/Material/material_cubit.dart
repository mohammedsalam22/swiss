import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/Repo/material_repo.dart';

part 'material_state.dart';

class ProducCubit extends Cubit<ProducState> {
  ProducCubit() : super(ProducState.initial());
  var material;

  Future getMaterial() async {
    emit(state.copyWith(status: ProducStatus.loading));
    try {
      material = await MaterialsRepo.material();
      emit(state.copyWith(status: ProducStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: ProducStatus.error));
    }
  }

  Future apiCalled(String url) async {
    emit(state.copyWith(status: ProducStatus.loading));
    try {
      material = await MaterialsRepo.materialApi(url);
      emit(state.copyWith(status: ProducStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: ProducStatus.error));
    }
  }
}
