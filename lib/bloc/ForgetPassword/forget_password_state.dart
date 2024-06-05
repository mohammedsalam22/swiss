part of 'forget_password_cubit.dart';

enum ForgetPasswordStatus {
  initial,
  loading,
  success,
  error,
}

enum RetrivePasswordStatus {
  initial,
  loading,
  success,
  error,
}

class ForgetPasswordState extends Equatable {
  final ForgetPasswordStatus status;
  final ForgetPasswordModel forgetPasswordModel;

  const ForgetPasswordState(
      {required this.status, required this.forgetPasswordModel});

  factory ForgetPasswordState.initial() => ForgetPasswordState(
      status: ForgetPasswordStatus.initial,
      forgetPasswordModel: ForgetPasswordModel.initial());

  @override
  List<Object?> get props => [status, forgetPasswordModel];

  ForgetPasswordState copyWith({
    ForgetPasswordStatus? status,
    ForgetPasswordModel? forgetPasswordModel,
  }) {
    return ForgetPasswordState(
      status: status ?? this.status,
      forgetPasswordModel: forgetPasswordModel ?? this.forgetPasswordModel,
    );
  }
}

class RetrivePasswordState extends Equatable {
  final RetrivePasswordStatus status;
  final RetrivePasswordModel retrivePasswordModel;

  const RetrivePasswordState(
      {required this.status, required this.retrivePasswordModel});

  factory RetrivePasswordState.initial() => RetrivePasswordState(
      status: RetrivePasswordStatus.initial,
      retrivePasswordModel: RetrivePasswordModel.initial());

  @override
  List<Object?> get props => [status, retrivePasswordModel];

  RetrivePasswordState copyWith({
    RetrivePasswordStatus? status,
    RetrivePasswordModel? retrivePasswordModel,
  }) {
    return RetrivePasswordState(
      status: status ?? this.status,
      retrivePasswordModel: retrivePasswordModel ?? this.retrivePasswordModel,
    );
  }
}
