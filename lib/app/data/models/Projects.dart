class Project {
  int? id;
  List<int>? participants;
  String? name;
  String? status;
  String? dueDate;
  bool? updated;
  String? details;
  int? time;
  List<Task>? task;

  Project({
    this.id,
    this.participants,
    this.name,
    this.status,
    this.dueDate,
    this.updated,
    this.details,
    this.time,
    this.task,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] as int?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      dueDate: json['due_date'] as String?,
      updated: json['updated'] as bool?,
      details: json['details'] as String?,
      time: json['time'] as int? ?? 0,
      task: (json['task'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Task {
  int? id;
  List<int>? participants;
  String? name;
  String? status;
  String? details;
  int? time;
  List<Subtask>? subtask;

  Task({
    this.id,
    this.participants,
    this.name,
    this.status,
    this.details,
    this.time,
    this.subtask,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as int?,
        participants: (json['participants'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        name: json['name'] as String?,
        status: json['status'] as String?,
        details: json['details'] as String?,
        time: json['time'] as int? ?? 0,
        subtask: (json['subtask'] as List<dynamic>?)
            ?.map((e) => Subtask.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class Subtask {
  int? id;
  List<int>? participants;
  String? name;
  String? status;
  String? details;
  int? time;

  Subtask({
    this.id,
    this.participants,
    this.name,
    this.status,
    this.details,
    this.time,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'] as int?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      details: json['details'] as String?,
      time: json['time'] as int? ?? 0,
    );
  }
}
