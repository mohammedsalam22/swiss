part of 'transiction_status_cubit.dart';
enum TransictionStatus {
  initial,
  loading,
  success,
  error,
}

class TransictionStatusState extends Equatable {
  final TransictionStatus status;
  final List material;

  const TransictionStatusState({required this.material, required this.status});

  factory TransictionStatusState.initial() =>
      const TransictionStatusState(status: TransictionStatus.initial, material: [], );

  @override
  List<Object?> get props => [status, material];

  TransictionStatusState copyWith({TransictionStatus? status, List? material}) {
    return TransictionStatusState(
      status: status ?? this.status,
      material: material ?? this.material,
    );
  }
}
