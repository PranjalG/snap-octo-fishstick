class Task {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.title,
    this.isDone,
    this.isDeleted
}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith ({
    String? title,
    bool? isDone,
    bool? isDeleted,
}) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted
    );
  }
}