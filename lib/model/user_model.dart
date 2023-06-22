class UserModel {
  UserModel({
    required this.data,
  });

  late final Data data;

  UserModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  late final String id;
  late final Attributes attributes;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = Attributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.name,
    required this.email,
    required this.age,
    this.profilePicture,
    this.linkedIn,
    this.position,
    this.bio,
    required this.points,
  });

  late final String name;
  late final String email;
  late final String age;
  late final Null profilePicture;
  late final Null linkedIn;
  late final Null position;
  late final Null bio;
  late final int points;

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    profilePicture = null;
    linkedIn = null;
    position = null;
    bio = null;
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['age'] = age;
    _data['profile_picture'] = profilePicture;
    _data['linked_in'] = linkedIn;
    _data['position'] = position;
    _data['bio'] = bio;
    _data['points'] = points;
    return _data;
  }
}
