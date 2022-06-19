// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang/cubit/navigatorUser.dart';
import 'package:tenang/globalPage/LoginModel.dart';
import 'package:tenang/user/HistoryUser.dart';
import 'package:tenang/user/HomeUser.dart';
import 'package:tenang/user/ProfilUser.dart';

class NavbarUser extends StatefulWidget {
  String id;
  NavbarUser({required this.id});
  @override
  State<NavbarUser> createState() => _NavbarUserState(id: id);
}

class _NavbarUserState extends State<NavbarUser> {
  String id;
  var role;
  var email;
  UserModel loggedInUser = UserModel();

  _NavbarUserState({required this.id});

  final _pageNavigationUser = [HomeUser(), HistoryUser(), ProfilUser()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigationUser.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 19, 42, 76),
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNavigator,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "Riwayat",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        )
      ],
      selectedItemColor: Color.fromARGB(255, 231, 235, 238),
      unselectedItemColor: Color.fromARGB(255, 255, 250, 237),
      showSelectedLabels: true,
    );
  }

  void _getChangeBottomNavigator(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }
}
