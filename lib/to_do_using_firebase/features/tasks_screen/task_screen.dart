import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/manager/provider/home_provider.dart';
import 'package:xo_game/to_do_using_firebase/features/tasks_screen/widgets/add_task_widget.dart';
import 'package:xo_game/to_do_using_firebase/features/tasks_screen/widgets/custom_card_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, provider, child) {
        return Column(
          children: [
            Stack(
              alignment: const Alignment(0, 2.3),
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0),
                        child: Text("To Do List",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: 300,
                          child: ChangeNotifierProvider.value(
                              value: provider, child: const AddTaskWidget()),
                        );
                      },
                    );
                  },
                  child: EasyInfiniteDateTimeLine(
                    showTimelineHeader: false,
                    dayProps: const EasyDayProps(
                      todayHighlightColor: Colors.amberAccent,
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      inactiveDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                    onDateChange: provider.setDate,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    focusDate: provider.selectedDate,
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 80),
            const CustomCardWidget(),
          ],
        );
      },
    );
  }
}
