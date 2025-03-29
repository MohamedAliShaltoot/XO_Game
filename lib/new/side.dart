import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blueGrey[900],
      child: Column(
        children: [
          const SizedBox(height: 50),
          _buildSidebarItem(Icons.dashboard, "Dashboard"),
          _buildSidebarItem(Icons.folder, "Projects"),
          _buildSidebarItem(Icons.settings, "Settings"),
          _buildSidebarItem(Icons.logout, "Logout"),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(label, style: const TextStyle(color: Colors.white)),
        onTap: () {},
      ),
    );
  }
}
