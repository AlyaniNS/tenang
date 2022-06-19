// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenang/admin/Konselor.dart';
import 'package:tenang/admin/Konsultasi.dart';
import 'package:tenang/admin/Pembayaran.dart';
import 'package:tenang/admin/ProfilAdmin.dart';
import 'package:tenang/cubit/navigatorUser.dart';
import 'package:tenang/globalPage/LoginModel.dart';

class NavbarAdmin extends StatefulWidget {
  String id;
  NavbarAdmin({required this.id});

  @override
  State<NavbarAdmin> createState() => _NavbarAdminState(id: id);
}

class _NavbarAdminState extends State<NavbarAdmin> {
  String id;
  var role;
  var email;
  UserModel loggedInUser = UserModel();

  final _pageNavigationAdmin = [Konsultasi(), Pembayaran(), ProfilAdmin()];

  _NavbarAdminState({required this.id});
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
    return _pageNavigationAdmin.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 19, 42, 76),
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNavigator,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_information),
          label: "Konsultasi",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments),
          label: "Pembayaran",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
          backgroundColor: Color.fromARGB(255, 255, 250, 237),
        ),
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
