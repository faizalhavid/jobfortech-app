class User {
  int? id;
  Profile? profile;
  List<dynamic>? company;
  String? lastLogin;
  String? firstName;
  String? lastName;
  bool? isActive;
  String? dateJoined;
  String? email;
  String? username;
  bool? status;
  String? phoneNumber;
  String? name;
  List<int>? groups;

  User({
    this.id,
    this.profile,
    this.company,
    this.lastLogin,
    this.firstName,
    this.lastName,
    this.isActive,
    this.dateJoined,
    this.email,
    this.username,
    this.status,
    this.phoneNumber,
    this.name,
    this.groups,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      profile: json['profile'] != null
          ? Profile.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
      company: json['company'] as List<dynamic>?,
      lastLogin: json['last_login'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      isActive: json['is_active'] as bool?,
      dateJoined: json['date_joined'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      status: json['status'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      name: json['name'] as String?,
      groups: (json['groups'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile': profile?.toJson(),
      'company': company,
      'last_login': lastLogin,
      'first_name': firstName,
      'last_name': lastName,
      'is_active': isActive,
      'date_joined': dateJoined,
      'email': email,
      'username': username,
      'status': status,
      'phone_number': phoneNumber,
      'name': name,
      'groups': groups,
    };
  }
}

class Profile {
  List<dynamic>? skills;
  List<dynamic>? expertise;
  List<dynamic>? industries;
  List<dynamic>? projectHistories;
  String? firstName;
  String? lastName;
  dynamic? photoProfile;
  String? location;
  String? description;
  dynamic? socialMedia;
  String? phoneNumber;
  dynamic? resume;
  String? position;

  Profile({
    this.skills,
    this.expertise,
    this.industries,
    this.projectHistories,
    this.firstName,
    this.lastName,
    this.photoProfile,
    this.location,
    this.description,
    this.socialMedia,
    this.phoneNumber,
    this.resume,
    this.position,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      skills: json['skills'] as List<dynamic>?,
      expertise: json['expertise'] as List<dynamic>?,
      industries: json['industries'] as List<dynamic>?,
      projectHistories: json['project_histories'] as List<dynamic>?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      photoProfile: json['photo_profile'],
      location: json['location'] as String?,
      description: json['description'] as String?,
      socialMedia: json['social_media'],
      phoneNumber: json['phone_number'] as String?,
      resume: json['resume'],
      position: json['position'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skills': skills,
      'expertise': expertise,
      'industries': industries,
      'project_histories': projectHistories,
      'first_name': firstName,
      'last_name': lastName,
      'photo_profile': photoProfile,
      'location': location,
      'description': description,
      'social_media': socialMedia,
      'phone_number': phoneNumber,
      'resume': resume,
      'position': position,
    };
  }
}
