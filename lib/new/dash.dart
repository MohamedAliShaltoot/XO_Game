import 'package:flutter/material.dart';
import 'package:xo_game/new/search.dart';
import 'package:xo_game/new/side.dart';
import 'package:xo_game/new/table.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("View all your projects",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  SearchField(),
                  SizedBox(height: 20),
                  ProjectTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
