class ToDoModel {
  final String? title;
  final String? time;
  final String? date;
  final String? description;

  ToDoModel({
    this.title,
    this.time,
    this.date,
    this.description,
  });

  ToDoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        time = json['time'] as String?,
        date = json['date'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
        'title': title,
        'time': time,
        'date': date,
        'description': description,
      };
}
