part of 'create_donor_transiction_cubit.dart';



enum CreateDonorTransictionStatus {
  initial,
  loading,
  success,
  error,
}

class CreateDonorTransictionState extends Equatable {
  final CreateDonorTransictionStatus status;

  const CreateDonorTransictionState({required this.status});

  factory CreateDonorTransictionState.initial() =>
      const CreateDonorTransictionState(status: CreateDonorTransictionStatus.initial );

  @override
  List<Object?> get props => [status];

  CreateDonorTransictionState copyWith({CreateDonorTransictionStatus? status}) {
    return CreateDonorTransictionState(
      status: status ?? this.status,
    );
  }
}
