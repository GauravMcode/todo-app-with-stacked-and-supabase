class Task {
  String name;
  String description;
  int? id;
  DateTime? createdAt;

  Task(
      {required this.name, required this.description, this.createdAt, this.id});

  factory Task.fromMap(Map map) {
    return Task(
      name: map['name'],
      description: map['description'],
      createdAt: DateTime.parse(map['created_at']),
      id: map['id'],
    );
  }

  toMap() {
    return id != null
        ? {
            "name": name,
            "description": description,
            "id": id,
          }
        : {"name": name, "description": description};
  }
}
