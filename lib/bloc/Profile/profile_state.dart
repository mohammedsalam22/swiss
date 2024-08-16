part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus status;

  const ProfileState({required this.status});

  factory ProfileState.initial() =>
      const ProfileState(status: ProfileStatus.initial);

  @override
  List<Object?> get props => [status];

  ProfileState copyWith({
    ProfileStatus? status,
  }) {
    return ProfileState(
      status: status ?? this.status,
    );
  }
}
