import 'package:bloc_state_management_app/BlocStateManagment/data/user_provider.dart';

abstract class UserState {}

class InitialState extends UserState {}

class SuccessUserList extends UserState {
  List<User> userList;
  bool userDivder;
  SuccessUserList(this.userList, this.userDivder);
}

class SuccessCreatedUser extends UserState {}

class LoadingState extends UserState {}

class FailureState extends UserState {}
