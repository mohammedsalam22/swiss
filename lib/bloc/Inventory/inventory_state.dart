part of 'inventory_cubit.dart';

enum InventoryStatus {
  initial,
  loading,
  success,
  error,
}

class InventoryState extends Equatable {
  final InventoryStatus status;
  final List material;

  const InventoryState({required this.material, required this.status});

  factory InventoryState.initial() => const InventoryState(
        status: InventoryStatus.initial,
        material: [],
      );

  @override
  List<Object?> get props => [status, material];

  InventoryState copyWith({InventoryStatus? status, List? material}) {
    return InventoryState(
      status: status ?? this.status,
      material: material ?? this.material,
    );
  }
}
