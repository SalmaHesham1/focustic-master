class SessionsModel {
  SessionsModel({
    required this.data,
  });

  late final List<Data> data;

  SessionsModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
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

  Data.fromJson(Map<String, dynamic> json) {
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
    required this.state,
    required this.startTime,
    required this.endTime,
  });

  late final String name;
  late final String state;
  late final String startTime;
  late final String endTime;

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    state = json['state'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['state'] = state;
    _data['start_time'] = startTime;
    _data['end_time'] = endTime;
    return _data;
  }
}

class Relationships {
  Relationships({
    required this.tasks,
  });

  late final List<dynamic> tasks;

  Relationships.fromJson(Map<String, dynamic> json) {
    tasks = List.castFrom<dynamic, dynamic>(json['tasks']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tasks'] = tasks;
    return _data;
  }
}
