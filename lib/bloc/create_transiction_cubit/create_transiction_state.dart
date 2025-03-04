part of 'create_transiction_cubit.dart';

enum CreateTransictionStatus {
  initial,
  loading,
  success,
  error,
}

class CreateTransictionState extends Equatable {
  final CreateTransictionStatus status;

  const CreateTransictionState({required this.status});

  factory CreateTransictionState.initial() =>
      const CreateTransictionState(status: CreateTransictionStatus.initial );

  @override
  List<Object?> get props => [status];

  CreateTransictionState copyWith({CreateTransictionStatus? status}) {
    return CreateTransictionState(
      status: status ?? this.status,
    );
  }
}
