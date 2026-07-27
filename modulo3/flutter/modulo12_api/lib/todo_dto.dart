// lib/todo_dto.dart
class TodoDto {
  final int id;
  final String title;
  final bool completed;

  TodoDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) {
    return TodoDto(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}