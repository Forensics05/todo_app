class Task {
  String id;
  String title;
  String description;
  DateTime dueDate;
  bool isComplete;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isComplete = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      isComplete: json['isComplete'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isComplete': isComplete,
    };
  }
}
