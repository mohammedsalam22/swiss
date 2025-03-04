import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repo/transiction_donor_status_repo.dart';

part 'transiction_donor_status_state.dart';


class TransictionDonorStatusCubit extends Cubit<TransictionDonorStatusState> {
  TransictionDonorStatusCubit() : super(TransictionDonorStatusState.initial());
  var material;

  Future gettransiction() async {
    emit(state.copyWith(status: TransictionDonorStatus.loading));
    try {
      material = await TransictionDonorStatusRepo.transiction();
      emit(state.copyWith(
          status: TransictionDonorStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: TransictionDonorStatus.error));
    }
  }

  Future transictionapiCalled(String url) async {
    emit(state.copyWith(status: TransictionDonorStatus.loading));
    try {
      material = await TransictionDonorStatusRepo.transictionApi(url);
      emit(state.copyWith(
          status: TransictionDonorStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: TransictionDonorStatus.error));
    }
  }
}
