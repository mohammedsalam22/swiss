import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Model/send_warrent.dart';
import 'package:swis_warehouse/data/Repo/send_warrent.dart';

part 'send_state.dart';

class SendWarrentCubit extends Cubit<SendWarrentState> {
  SendWarrentCubit() : super(SendWarrentState.initial());

  Future sendWarrent(
      String warrentName,
      int warrentNum,
      int wieght,
      String date,
      String name,
      String companyName,
      int driverId,
      String details) async {
    emit(state.copyWith(status: SendStatus.loading));
    try {
      var sendWarrent = await SendWarrentRepo().sendWarrent(warrentName,
          warrentNum, wieght, date, name, companyName, driverId, details);

      emit(state.copyWith(
          status: SendStatus.success,
          sendWarrentModel: SendWarrentModel(
            warrentName: sendWarrent["user"]['name'],
            warrentNum: sendWarrent["user"]['name'],
            wieght: sendWarrent["user"]['name'],
            date: sendWarrent["user"]['name'],
            companyName: sendWarrent["user"]['name'],
            name: sendWarrent["user"]['name'],
            driverId: sendWarrent["user"]['name'],
            details: sendWarrent["user"]['name'],
          )));
    } catch (error) {
      emit(state.copyWith(status: SendStatus.error));
    }
  }
}
