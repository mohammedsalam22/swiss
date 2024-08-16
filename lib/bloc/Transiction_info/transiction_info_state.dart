part of 'transiction_info_cubit.dart';

enum TransictionInfoStatus {
  initial,
  loading,
  success,
  error,
}

class TransictionInfoState extends Equatable {
  final TransictionInfoStatus status;
  final List material;

  const TransictionInfoState({required this.material, required this.status});

  factory TransictionInfoState.initial() =>
      const TransictionInfoState(status: TransictionInfoStatus.initial, material: [], );

  @override
  List<Object?> get props => [status, material];

  TransictionInfoState copyWith({TransictionInfoStatus? status, List? material}) {
    return TransictionInfoState(
      status: status ?? this.status,
      material: material ?? this.material,
    );
  }
}
