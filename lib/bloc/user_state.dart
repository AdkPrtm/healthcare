part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserFailed extends UserState {
  final String? msg;
  UserFailed(this.msg);
  @override
  List<Object?> get props => [msg];
}

class UserSuccess extends UserState {
  final UserModel userModel;
  UserSuccess(this.userModel);
  @override
  List<Object?> get props => [userModel];
}
