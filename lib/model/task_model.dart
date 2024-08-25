class TaskModel {
  String id;
  String title;
  String description;
  var date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromFire(Map<String, dynamic> fromStore)
      : this(
            title: fromStore["title"],
            description: fromStore["description"],
            date: fromStore["date"],
            isDone: fromStore["isDone"],
            id: fromStore["id"]
  );

  Map<String, dynamic> toStore() {
    return {
      "title": title,
      "description": description,
      "date": date,
      "isDone": isDone,
      "id": id,
    };
  }
}
