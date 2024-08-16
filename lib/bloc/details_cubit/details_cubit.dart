import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState.initial());

  var detail ;

  Future details (int id) async {
    emit(state.copyWith(status: DetailsStatus.loading)) ;
    try {
      detail = await DetailsRepo.material(id) ;
      emit(state.copyWith(status: DetailsStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: DetailsStatus.error)) ;
    }
  }
}
