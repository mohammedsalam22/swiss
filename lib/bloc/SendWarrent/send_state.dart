// part of 'send_cubit.dart';
//
// enum SendStatus {
//   initial,
//   loading,
//   success,
//   error,
// }
//
// class SendWarrentState extends Equatable {
//   final SendStatus status;
//   final SendWarrentModel sendWarrentModel;
//
//   const SendWarrentState(
//       {required this.status, required this.sendWarrentModel});
//
//   factory SendWarrentState.initial() => SendWarrentState(
//       status: SendStatus.initial, sendWarrentModel: SendWarrentModel.initial());
//
//   @override
//   List<Object?> get props => [status, sendWarrentModel];
//
//   SendWarrentState copyWith({
//     SendStatus? status,
//     SendWarrentModel? sendWarrentModel,
//   }) {
//     return SendWarrentState(
//       status: status ?? this.status,
//       sendWarrentModel: sendWarrentModel ?? this.sendWarrentModel,
//     );
//   }
// }
