// class UserModel {
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

class UserModel {
  String? uid;
  String? techRoles; //relation

  String? name;
  String? bio;
  String? photoProfile;
  String? phoneNumber;
  String? email;
  String? birthDate;
  String? address;
  String? country;
  UserModel({
    this.uid,
    this.techRoles, //relation

    this.name,
    this.bio,
    this.photoProfile,
    this.phoneNumber,
    this.email,
    this.birthDate,
    this.address,
    this.country,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    techRoles = json['techRoles']; //relation

    name = json['name'];
    bio = json['bio'];
    photoProfile = json['photoProfile'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    birthDate = json['birthDate'];
    address = json['address'];
    country = json['country'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['techRoles'] = techRoles; //relation

    data['name'] = name;
    data['bio'] = bio;
    data['photoProfile'] = photoProfile;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['birthDate'] = birthDate;
    data['address'] = address;
    data['country'] = country;
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
