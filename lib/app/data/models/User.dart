class User {
  int? id;
  String? title;
  String? profile;
  String? company;
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
    this.title,
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
      title: json['title'] as String?,
      profile: json['profile'] as String?,
      company: json['company'] as String?,
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
      'title': title,
      'profile': profile,
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
