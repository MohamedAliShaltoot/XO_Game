import 'package:flutter/material.dart';
import 'package:xo_game/core/models/task_model.dart';
import 'package:xo_game/core/service/fire_base_functions.dart';
import 'package:xo_game/to_do_using_firebase/features/settings_screen/settings_screen.dart';
import 'package:xo_game/to_do_using_firebase/features/tasks_screen/task_screen.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDatePicker = DateTime.now();
  List<Widget> screens = [const TaskScreen(), const SettingsScreen()];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setDatePicker(DateTime date) {
    selectedDatePicker = date;
    notifyListeners();
  }

  void addTask() {
    TaskModel taskModel = TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        time: selectedDatePicker.millisecondsSinceEpoch,
        isDone: false);
    FireBaseFunctions.addTask(taskModel);
  }
}
