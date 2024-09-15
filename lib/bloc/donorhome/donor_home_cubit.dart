import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/Repo/donor_home_repo.dart';

part 'donor_home_state.dart';

class DonorHomeCubit extends Cubit<DonorHomeState> {
  DonorHomeCubit() : super(DonorHomeState.initial());

  var home1 ;

  Future home () async {
    emit(state.copyWith(status: DonorHomeStatus.loading)) ;
    try {
      home1 = await DonorHomeRepo.home() ;
      emit(state.copyWith(status: DonorHomeStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: DonorHomeStatus.error)) ;
    }
  }
}
