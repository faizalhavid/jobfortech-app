// class User {
//   User? user;

//   User({this.user});

//   User.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? User?.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user?.toJson();
//     }
//     return data;
//   }
// }

class User {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? photoProfile;
  String? address;
  int? role;
  String? bio;
  String? birthDate;
  String? country;
  SocialMedia? socialMedia;
  int? workDesk;

  User({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.photoProfile,
    this.address,
    this.role,
    this.bio,
    this.birthDate,
    this.country,
    this.socialMedia,
    this.workDesk,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    photoProfile = json['photo_profile'];
    address = json['address'];
    role = json['role'];
    bio = json['bio'];
    birthDate = json['birth_date'];
    country = json['country'];
    socialMedia = json['social_media'] != null
        ? SocialMedia.fromJson(json['social_media'])
        : null;
    workDesk = json['work_desk'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['photo_profile'] = photoProfile;
    data['address'] = address;
    data['role'] = role;
    data['bio'] = bio;
    data['birth_date'] = birthDate;
    data['country'] = country;
    if (socialMedia != null) {
      data['social_media'] = socialMedia?.toJson();
    }
    data['work_desk'] = workDesk;
    return data;
  }
}

class SocialMedia {
  String? linkedin;
  String? github;

  SocialMedia({
    this.linkedin,
    this.github,
  });

  SocialMedia.fromJson(Map<String, dynamic> json) {
    linkedin = json['linkedin'];
    github = json['github'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['linkedin'] = linkedin;
    data['github'] = github;
    return data;
  }
}
