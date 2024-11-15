import 'dart:async';
//import 'dart:math';

import 'package:bloc_state_management_app/BlocStateManagment/bloc/user_event.dart';
import 'package:bloc_state_management_app/BlocStateManagment/data/user_provider.dart';

import 'user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  UsersBloc() : super(InitialState()) {
    on<GetUserEvent>(_getUserList);
    on<AddUserEvent>(_addUser);
    on<SetToInitialState>(_toInitialState);
  }

  FutureOr<void> _getUserList(
      GetUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    try {
      List<User> user = await ApiProvider().getUsers();
      print("============== user ==================");
      print(user);
      emit(SuccessUserList(user, false));
    } catch (error) {
      print("=========================== The Error =============");
      print(error);
      emit(FailureState());
    }
  }

  FutureOr<void> _addUser(AddUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    try {
      bool isCreated = await ApiProvider()
          .postUser(name: event.name, gender: event.gender, email: event.email);
      if (isCreated) {
        emit(SuccessCreatedUser());
      } else {
        emit(FailureState());
      }
    } catch (error) {
      print(error);
      emit(FailureState());
    }
  }

  FutureOr<void> _toInitialState(
      SetToInitialState event, Emitter<UserState> emit) {
    emit(InitialState());
  }
}
