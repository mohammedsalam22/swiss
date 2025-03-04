import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/create_donor_transiction_repo.dart';
import 'package:swis_warehouse/data/Repo/create_transiction_repo.dart';

part 'create_transiction_state.dart';

class CreateTransictionCubit extends Cubit<CreateTransictionState> {
  CreateTransictionCubit() : super(CreateTransictionState.initial());

  Future transiction(Map data) async {
    emit(state.copyWith(status: CreateTransictionStatus.loading)) ;
    try {
      await CreateTransictionRepo.sendTransiction(data);
      emit(state.copyWith(status: CreateTransictionStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: CreateTransictionStatus.error)) ;
    }
  }
}
