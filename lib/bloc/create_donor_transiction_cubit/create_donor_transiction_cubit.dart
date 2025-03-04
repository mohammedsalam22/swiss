import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/create_donor_transiction_repo.dart';
import 'package:swis_warehouse/data/Repo/create_transiction_repo.dart';

part 'create_donor_transiction_state.dart';

class CreateDonorTransictionCubit extends Cubit<CreateDonorTransictionState> {
  CreateDonorTransictionCubit() : super(CreateDonorTransictionState.initial());

  Future transiction(Map data) async {
    emit(state.copyWith(status: CreateDonorTransictionStatus.loading)) ;
    try {
      await CreateTransictionRepo.sendTransiction(data);
      emit(state.copyWith(status: CreateDonorTransictionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: CreateDonorTransictionStatus.error)) ;
    }
  }
}
