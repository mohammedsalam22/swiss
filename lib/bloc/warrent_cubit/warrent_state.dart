part of 'warrent_cubit.dart';

enum WarrentStatus {
  initial,
  loading,
  success,
  error,
}

class WarrentState extends Equatable {
  final WarrentStatus status;

  const WarrentState({required this.status});

  factory WarrentState.initial() =>
      const WarrentState(status: WarrentStatus.initial );

  @override
  List<Object?> get props => [status];

  WarrentState copyWith({WarrentStatus? status}) {
    return WarrentState(
      status: status ?? this.status,
    );
  }
}
