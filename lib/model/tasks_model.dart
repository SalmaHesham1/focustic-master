class TasksModel {
  TasksModel({
    required this.data,
  });

  late final List<Data> data;

  TasksModel.fromJson(Map<String, dynamic> json) {
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
  late final List<dynamic> relationships;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = Attributes.fromJson(json['attributes']);
    relationships = List.castFrom<dynamic, dynamic>(json['relationships']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['attributes'] = attributes.toJson();
    _data['relationships'] = relationships;
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.name,
    required this.note,
    required this.state,
    required this.duration,
    required this.reminder,
    required this.reminderDate,
    required this.kind,
    required this.repeat,
    required this.initiatedAt,
    required this.dueDate,
  });
  late final String name;
  late final String note;
  late final String state;
  late final String duration;
  late final int reminder;
  late final String reminderDate;
  late final String kind;
  late final int repeat;
  late final String initiatedAt;
  late final String dueDate;

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    note = json['note'];
    state = json['state'];
    duration = json['duration'];
    reminder = json['reminder'];
    reminderDate = json['reminder_date'];
    kind = json['kind'];
    repeat = json['repeat'];
    initiatedAt = json['initiated_at'];
    dueDate = json['due_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['note'] = note;
    _data['state'] = state;
    _data['duration'] = duration;
    _data['reminder'] = reminder;
    _data['reminder_date'] = reminderDate;
    _data['kind'] = kind;
    _data['repeat'] = repeat;
    _data['initiated_at'] = initiatedAt;
    _data['due_date'] = dueDate;
    return _data;
  }
}