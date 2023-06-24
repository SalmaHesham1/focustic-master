class UserCommunityModel {
  UserCommunityModel({
    required this.data,
  });
  late final List<Data> data;

  UserCommunityModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.attributes,
    required this.relationships,
  });
  late final String id;
  late final Attributes attributes;
  late final Relationships relationships;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    attributes = Attributes.fromJson(json['attributes']);
    relationships = Relationships.fromJson(json['relationships']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    _data['relationships'] = relationships.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.name,
    required this.description,
    required this.usersCount,
    required this.createdBy,
  });
  late final String name;
  late final String description;
  late final int usersCount;
  late final int createdBy;

  Attributes.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    usersCount = json['users_count'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['users_count'] = usersCount;
    _data['created_by'] = createdBy;
    return _data;
  }
}

class Relationships {
  Relationships({
    required this.users,
  });
  late final List<Users> users;

  Relationships.fromJson(Map<String, dynamic> json){
    users = List.from(json['users']).map((e)=>Users.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['users'] = users.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Users {
  Users({
    required this.id,
    required this.attributes,
  });
  late final String id;
  late final AttributesUser attributes;

  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    attributes = AttributesUser.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class AttributesUser {
  AttributesUser({
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
  late final String? bio;
  late final int points;

  AttributesUser.fromJson(Map<String, dynamic> json){
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