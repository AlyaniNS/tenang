import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  /// update index function to update the index onTap in BottomNavigationBar
  void updateIndex(int index) => emit(index);

  void getKonselor() => emit(0);
  void getKonsultasi() => emit(1);
  void getPembayaran() => emit(2);
}
