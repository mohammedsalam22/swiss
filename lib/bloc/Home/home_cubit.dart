import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  var home1 ;

  Future home () async {
    emit(state.copyWith(status: HomeStatus.loading)) ;
    try {
      home1 = await HomeRepo.home() ;
      emit(state.copyWith(status: HomeStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error)) ;
    }
  }
}
