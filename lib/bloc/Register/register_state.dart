part of 'register_cubit.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  error,
}

class RegisterState extends Equatable{
  final RegisterStatus status;
  final RegisterModel registerModel;

  const RegisterState({required this.status, required this.registerModel});

  factory RegisterState.initial() => RegisterState(
      status: RegisterStatus.initial, registerModel: RegisterModel.initial());

  List<Object?> get props => [status, registerModel];

  RegisterState copyWith({
    RegisterStatus? status,
    RegisterModel? registerModel,
  }) {
    return RegisterState(
      status: status ?? this.status,
      registerModel: registerModel ?? this.registerModel,
    );
  }
}
