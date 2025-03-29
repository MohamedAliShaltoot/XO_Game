import 'package:flutter/material.dart';

class ProjectTable extends StatelessWidget {
  const ProjectTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTableHeader(),
            const Divider(),
            Expanded(child: _buildTableBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Projects",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
    );
  }

  Widget _buildTableBody() {
    return ListView(
      children: List.generate(
          5, (index) => _buildTableRow("Project ${index + 1}", "In Progress")),
    );
  }

  Widget _buildTableRow(String projectName, String status) {
    return ListTile(
      leading: const Icon(Icons.folder, color: Colors.blue),
      title: Text(projectName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(status, style: TextStyle(color: Colors.green.shade700)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.blue)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red)),
        ],
      ),
    );
  }
}
