import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healthcare/models/models.dart';
import 'package:healthcare/services/services.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      yield UserLoading();
      UserModel userModel = await UserService().getUserById(event.id);
      yield UserSuccess(userModel);
    } else if (event is SignUpUser) {
      yield UserLoading();
      SignInSignUpResult result = await AuthService().signUp(
          name: event.name, email: event.email, password: event.password);
      if (result.userModel == null) {
        yield UserFailed(result.message);
      } else {
        UserModel? userModel = result.userModel;
        yield UserSuccess(userModel!);
      }
    } else if (event is SignInUser) {
      yield UserLoading();
      SignInSignUpResult result = await AuthService()
          .signIn(email: event.email, password: event.password);
      if (result.userModel == null) {
        yield UserFailed(result.message);
      } else {
        UserModel? userModel = result.userModel;
        yield UserSuccess(userModel!);
      }
    } else if (event is UpdateDataUser) {
      yield UserLoading();
      await UserService().updateUser(
          uid: event.uid, name: event.name, pickedImage: event.imageUrl);
      UserModel userModel = await UserService().getUserById(event.uid);
      yield UserSuccess(userModel);
    } else if (event is SignOutUser) {
      await AuthService().signOut();
      yield UserInitial();
    }
  }
}
