import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xo_game/core/service/fire_base_functions.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: const ValueKey("test"),
        startActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(15),
            ),
            SlidableAction(
              onPressed: (context) {
              //  FireBaseFunctions().mainFunction();
              },
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.black,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 5,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 15),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Task title",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Task desc"),
                  Spacer(),
                  Row(
                    children: [
                      Icon(Icons.timelapse, color: Colors.black),
                      SizedBox(width: 5),
                      Text("10 :20 AM",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
