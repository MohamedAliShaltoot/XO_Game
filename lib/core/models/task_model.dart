class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int time;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.time,
   required this.isDone ,
  });

  // Factory method to create a TaskModel from a map
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isDone: json['isDone'] ?? false,
      time: json['time'] ?? 0,
    );
  }

  // Method to convert a TaskModel to a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'time': time
    };
  }
}
