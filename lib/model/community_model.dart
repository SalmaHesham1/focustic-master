class CommunityModel {
  CommunityModel({
    required this.data,
  });
  late final List<DataCommunity> data;

  CommunityModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataCommunity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DataCommunity {
  DataCommunity({
    required this.id,
    required this.attributes,
    required this.relationships,
  });
  late final String id;
  late final Attributes attributes;
  late final Relationships relationships;

  DataCommunity.fromJson(Map<String, dynamic> json){
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
  late final Attributes attributes;

  Users.fromJson(Map<String, dynamic> json){
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