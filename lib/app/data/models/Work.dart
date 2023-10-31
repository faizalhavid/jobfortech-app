import 'package:jobfortech/app/data/models/User.dart';

class Work {
  int id;
  Project? project;
  Company? company;
  String? position;
  List<String>? technology;
  String? experience;
  String? jobType;
  String? location;
  int? minSalary;
  int? maxSalary;
  int? vacancies;
  String? description;
  String? additional;
  String? status;
  DateTime? publishDate;
  DateTime? closedOn;
  bool? saveStatus;
  int? user;

  Work({
    required this.id,
    this.project,
    this.position,
    this.technology,
    this.experience,
    this.jobType,
    this.location,
    this.minSalary,
    this.maxSalary,
    this.vacancies,
    this.description,
    this.additional,
    this.status,
    this.publishDate,
    this.closedOn,
    this.saveStatus,
    this.user,
    this.company,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      id: json['id'] as int,
      project: json['project'] != null
          ? Project.fromJson(json['project'] as Map<String, dynamic>)
          : null,
      position: json['position'] as String?,
      technology: json['technology'] != null
          ? (json['technology'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          : null,
      experience: json['experience'] as String?,
      jobType: json['job_type'] as String?,
      location: json['location'] as String?,
      minSalary: json['min_salary'] as int?,
      maxSalary: json['max_salary'] as int?,
      vacancies: json['vacancies'] as int?,
      description: json['description'] as String?,
      additional: json['additional'] as String?,
      status: json['status'] as String?,
      publishDate: json['publish_date'] != null
          ? DateTime.parse(json['publish_date'] as String)
          : DateTime.now(),
      closedOn: json['closedOn'] != null
          ? DateTime.parse(json['closed_on'] as String)
          : DateTime.now(),
      saveStatus: json['save_status'] as bool?,
      user: json['user'] as int?,
      company: json['company'] != null
          ? Company.fromJson(json['company'] as Map<String, dynamic>)
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
  String? status;
  DateTime? dueDate;
  bool updated;
  int user;

  Project({
    required this.id,
    this.participants,
    this.name,
    this.details,
    this.time,
    this.status,
    this.dueDate,
    required this.updated,
    required this.user,
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
      status: json['status'] as String?,
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : DateTime.now(),
      updated: json['updated'] as bool,
      user: json['user'] as int,
    );
  }
}

class Company {
  int id;
  String? name;
  String? address;
  String? email;
  String? website;
  String? photo_profile;
  User? user_profile;

  Company({
    required this.id,
    this.name,
    this.address,
    this.email,
    this.website,
    this.photo_profile,
    required this.user_profile,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int,
      name: json['name'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      photo_profile: json['photo_profile'] as String?,
      user_profile: json['user_profile'] != null &&
              json['user_profile'] is Map<String, dynamic>
          ? User.fromJson(json['user_profile'] as Map<String, dynamic>)
          : null,
    );
  }
}
