import 'package:bloc_state_management_app/BlocStateManagment/bloc/user_event.dart';
import 'package:bloc_state_management_app/BlocStateManagment/data/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_state.dart';
import '../bloc/user_bloc.dart';

class MyBlocPage extends StatefulWidget {
  const MyBlocPage({super.key});

  @override
  State<MyBlocPage> createState() => _MyBlocPageState();
}

class _MyBlocPageState extends State<MyBlocPage> {
  bool change = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  /// --------------- Focus Here  ----------------------- *
  Widget buildBloc() {
    return BlocBuilder<UsersBloc, UserState>(builder: (context, state) {
      if (state is SuccessCreatedUser) {
        return const Center(child: Text("Success Creating User"));
      }
      if (state is FailureState) {
        return const Text("Errrrror!!!!",
            style: TextStyle(color: Colors.red, fontSize: 40));
      }
      // Loading
      if (state is LoadingState)
        return const Center(child: CircularProgressIndicator());

      // Succuess
      if (state is SuccessUserList) {
        List<User> userList = state.userList;
        return buildUserList(userList, state.userDivder);
      }

      // Inital
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<UsersBloc>().add(GetUserEvent());
              },
              child: const Text("Get User List")),
          ElevatedButton(
              onPressed: () {
                context.read<UsersBloc>().add(AddUserEvent(
                    email: "m.mfdfddfdmm@gmail.com",
                    gender: "Male",
                    name: "Ali m f Rozaria"));
              },
              child: const Text("Add a User"))
        ],
      ));
    });
  }
  /** 
   --------------- Focus Here  -----------------------
     **/

  Widget buildUserList(List<User> users, bool useDivider) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
              ),
              if (useDivider) const Divider()
            ],
          );
        });
  }
}
