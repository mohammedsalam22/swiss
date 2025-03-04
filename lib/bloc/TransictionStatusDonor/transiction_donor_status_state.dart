part of "transiction_donor_status_cubit.dart";
enum TransictionDonorStatus {
  initial,
  loading,
  success,
  error,
}

class TransictionDonorStatusState extends Equatable {
  final TransictionDonorStatus status;
  final List material;

  const TransictionDonorStatusState({required this.material, required this.status});

  factory TransictionDonorStatusState.initial() =>
      const TransictionDonorStatusState(status: TransictionDonorStatus.initial, material: [], );

  @override
  List<Object?> get props => [status, material];

  TransictionDonorStatusState copyWith({TransictionDonorStatus? status, List? material}) {
    return TransictionDonorStatusState(
      status: status ?? this.status,
      material: material ?? this.material,
    );
  }
}
