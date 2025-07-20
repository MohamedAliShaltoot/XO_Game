import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xo_game/to_do_using_firebase/features/home_screen/manager/provider/home_provider.dart';

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
                EasyInfiniteDateTimeLine(
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
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  focusDate: provider.selectedDate,
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
