import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swis_warehouse/data/Repo/export_file_api.dart';
import 'package:swis_warehouse/data/Repo/invintory_repo.dart';

part 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit() : super(InventoryState.initial());
  var material;
  var files;
  var qq ;
  var search1 ;

  Future getMaterial(String Firstdate,String LastDate) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      material = await InventoryRepo.material(Firstdate,LastDate);
      emit(state.copyWith(status: InventoryStatus.success,));
    } catch (error) {
      emit(state.copyWith(status: InventoryStatus.error));
    }
  }

  Future exportFile(String Firstdate,String LastDate) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      await ExportFileRepo.export(Firstdate,LastDate);
      emit(state.copyWith(status: InventoryStatus.success,));
    } catch (error) {
      emit(state.copyWith(status: InventoryStatus.error));
    }
  }

  Future download(String url) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      qq = await ExportFileRepo.download(url);
      print(qq) ;
      emit(state.copyWith(status: InventoryStatus.success,));
    } catch (error) {
      emit(state.copyWith(status: InventoryStatus.error));
    }
  }

  Future getAllFile() async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      files = await ExportFileRepo.getAll();
      emit(state.copyWith(status: InventoryStatus.success,));
    } catch (error) {
      emit(state.copyWith(status: InventoryStatus.error));
    }
  }

  Future search(String data) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      search1 = await ExportFileRepo.search(data);
      emit(state.copyWith(status: InventoryStatus.success,));
    } catch (error) {
      emit(state.copyWith(status: InventoryStatus.error));
    }
  }

  // Future apiCalled(String url) async {
  //   emit(state.copyWith(status: InventoryStatus.loading));
  //   try {
  //     material = await InventoryRepo.materialApi(url);
  //     emit(state.copyWith(status: InventoryStatus.success, material: material));
  //   } catch (error) {
  //     emit(state.copyWith(status: ProducStatus.error));
  //   }
  // }
}
