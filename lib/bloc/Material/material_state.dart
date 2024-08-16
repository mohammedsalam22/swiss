part of 'material_cubit.dart';

enum ProducStatus {
  initial,
  loading,
  success,
  error,
}

class ProducState extends Equatable {
  final ProducStatus status;
  final List material;

  const ProducState({required this.material, required this.status});

  factory ProducState.initial() =>
      const ProducState(status: ProducStatus.initial, material: [], );

  @override
  List<Object?> get props => [status, material];

  ProducState copyWith({ProducStatus? status, List? material}) {
    return ProducState(
      status: status ?? this.status,
      material: material ?? this.material,
    );
  }
}
