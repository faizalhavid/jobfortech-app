class Subtask {
  int id;
  List<int>? participants;
  String? name;
  String? status;
  bool updated;
  String? details;
  int? time;
  int user;

  Subtask({
    required this.id,
    this.participants,
    this.name,
    this.status,
    required this.updated,
    this.details,
    this.time,
    required this.user,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'] as int,
      participants: json['participants'] != null
          ? (json['participants'] as List<dynamic>)
              .map((e) => e as int)
              .toList()
          : null,
      name: json['name'] as String?,
      status: json['status'] as String?,
      updated: json['updated'] as bool,
      details: json['details'] as String?,
      time: json['time'] as int?,
      user: json['user'] as int,
    );
  }
}

class Task {
  int id;
  List<int>? participants;
  String? name;
  String? status;
  bool updated;
  String? details;
  int? time;
  List<Subtask>? subtask;

  Task({
    required this.id,
    this.participants,
    this.name,
    this.status,
    required this.updated,
    this.details,
    this.time,
    this.subtask,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      participants: json['participants'] != null
          ? (json['participants'] as List<dynamic>)
              .map((e) => e as int)
              .toList()
          : null,
      name: json['name'] as String?,
      status: json['status'] as String?,
      updated: json['updated'] as bool,
      details: json['details'] as String?,
      time: json['time'] as int?,
      subtask: json['subtask'] != null
          ? (json['subtask'] as List<dynamic>)
              .map((item) => Subtask.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class Project {
  int id;
  List<int>? participants;
  String? name;
  String? details;
  int? time;
  DateTime? dueDate;
  String? status;
  bool updated;
  int? user;
  Task? task;

  Project({
    required this.id,
    this.participants,
    this.name,
    this.details,
    this.time,
    this.dueDate,
    this.status,
    required this.updated,
    required this.user,
    this.task,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as int,
      participants: json['participants'] != null
          ? (json['participants'] as List<dynamic>)
              .map((e) => e as int)
              .toList()
          : null,
      name: json['name'] as String?,
      details: json['details'] as String?,
      time: json['time'] as int?,
      dueDate: json['due_date'] != null
          ? DateTime.parse(json['due_date'] as String)
          : DateTime.now(),
      status: json['status'] as String?,
      updated: json['updated'] as bool,
      user: json['user'] as int?,
      task: json['task'] != null
          ? Task.fromJson(json['task'] as Map<String, dynamic>)
          : null,
    );
  }
}

class ProjectReport {
  final Project project;
  final int todoTask;
  final int completedTask;
  final int ongoingTask;
  final int task;

  ProjectReport(
      {required this.project,
      required this.todoTask,
      required this.completedTask,
      required this.ongoingTask,
      required this.task});

  factory ProjectReport.fromJson(Map<String, dynamic> json) {
    return ProjectReport(
      project: Project.fromJson(json['project']),
      todoTask: json['todo_task'],
      completedTask: json['completed_task'],
      ongoingTask: json['on-going_task'],
      task: json['task'],
    );
  }
}
