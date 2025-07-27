import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/manager/provider/home_provider.dart';

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider provider, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              const Text(
                'Add your Task',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task Title',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task Description',
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: provider.selectedDatePicker,
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((value) {
                    if (value != null) {
                      provider.setDatePicker(value);
                    }
                  });
                },
                child:
                    const Text("Select Date", style: TextStyle(fontSize: 18)),
              ),
              Text(
                provider.selectedDatePicker.toString().substring(0, 10),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Logic to add the task
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
