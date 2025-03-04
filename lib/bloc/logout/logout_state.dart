part of 'logout_cubit.dart';

enum LogoutStatus {
  initial,
  loading,
  success,
  error,
}

class LogoutState extends Equatable {
  final LogoutStatus status;

  const LogoutState({required this.status,});

  factory LogoutState.initial() =>
      LogoutState(status: LogoutStatus.initial,);

  @override
  List<Object?> get props => [status];

  LogoutState copyWith({
    LogoutStatus? status,
  }) {
    return LogoutState(
      status: status ?? this.status,
    );
  }
}
