import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/send_warrent.dart';
import 'package:swis_warehouse/data/Repo/sending_warrent_repo.dart';

part 'warrent_state.dart';

class WarrentCubit extends Cubit<WarrentState> {
  WarrentCubit() : super(WarrentState.initial());

  Future warrent(Map data) async {
    emit(state.copyWith(status: WarrentStatus.loading)) ;
    try {
      await SendingWarrentRepo.sendWarrent(data);
      emit(state.copyWith(status: WarrentStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: WarrentStatus.error)) ;
    }
  }
}
