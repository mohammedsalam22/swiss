import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../constant_stuff/url.dart';
import '../../data/Repo/transiction_status_repo.dart';

part 'transiction_status_state.dart';

class TransictionStatusCubit extends Cubit<TransictionStatusState> {
  TransictionStatusCubit() : super(TransictionStatusState.initial());
  var material;

  Future gettransiction() async {
    emit(state.copyWith(status: TransictionStatus.loading));
    try {
      material = await TransictionStatusRepo.transiction();
      emit(state.copyWith(
          status: TransictionStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: TransictionStatus.error));
    }
  }

  Future transictionapiCalled(String url) async {
    emit(state.copyWith(status: TransictionStatus.loading));
    try {
      material = await TransictionStatusRepo.transictionApi(url);
      emit(state.copyWith(
          status: TransictionStatus.success, material: material));
    } catch (error) {
      emit(state.copyWith(status: TransictionStatus.error));
    }
  }
}
