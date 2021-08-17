part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent {
  final String id;
  LoadUser(this.id);
  @override
  List<Object?> get props => [id];
}

class SignUpUser extends UserEvent {
  final String name, email, password;

  SignUpUser(this.name, this.email, this.password);

  @override
  List<Object?> get props => [name, email, password];
}

class SignInUser extends UserEvent {
  final String email, password;

  SignInUser(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
