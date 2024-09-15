part of 'donor_home_cubit.dart';

enum DonorHomeStatus {
  initial,
  loading,
  success,
  error,
}

class DonorHomeState extends Equatable {
  final DonorHomeStatus status;

  const DonorHomeState({required this.status});

  factory DonorHomeState.initial() =>
      const DonorHomeState(status: DonorHomeStatus.initial);

  @override
  List<Object?> get props => [status];

  DonorHomeState copyWith({
    DonorHomeStatus? status,
  }) {
    return DonorHomeState(
      status: status ?? this.status,
    );
  }
}
