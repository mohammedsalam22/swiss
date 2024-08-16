import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/Repo/transiction_info_repo.dart';

part 'transiction_info_state.dart';
class TransictionInfoCubit extends Cubit<TransictionInfoState> {
  TransictionInfoCubit() : super(TransictionInfoState.initial());
  var material;

  Future getinfo(int id) async {
    emit(state.copyWith(status: TransictionInfoStatus.loading));
    try {
      material = await TransictionInfoRepo.transiction(id);
      emit(state.copyWith(status: TransictionInfoStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: TransictionInfoStatus.error));
    }
  }
}
