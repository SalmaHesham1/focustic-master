class LoginAndRegisterModel {
  LoginAndRegisterModel({
    required this.status,
    this.message,
    required this.data,
  });

  late final String status;
  late final Null message;
  late final Data data;

  LoginAndRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = null;
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  late final User user;
  late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    this.profilePicture,
    this.linkedInUrl,
    this.position,
    this.bio,
    required this.points,
  });

  late final int id;
  late final String name;
  late final int age;
  late final String email;
  late final Null profilePicture;
  late final Null linkedInUrl;
  late final Null position;
  late final Null bio;
  late final int points;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    email = json['email'];
    profilePicture = null;
    linkedInUrl = null;
    position = null;
    bio = null;
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['age'] = age;
    _data['email'] = email;
    _data['profile_picture'] = profilePicture;
    _data['linkedIn_url'] = linkedInUrl;
    _data['position'] = position;
    _data['bio'] = bio;
    _data['points'] = points;
    return _data;
  }
}
