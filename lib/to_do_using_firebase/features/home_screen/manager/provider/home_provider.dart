import 'package:flutter/material.dart';
import 'package:xo_game/to_do_using_firebase/features/settings_screen/settings_screen.dart';
import 'package:xo_game/to_do_using_firebase/features/tasks_screen/task_screen.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  List<Widget> screens = [
    const TaskScreen(),
    const SettingsScreen()
  ];
  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}