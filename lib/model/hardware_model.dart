class HardwareModel {
  HardwareModel({
    required this.data,
  });
  late final List<Data> data;

  HardwareModel.fromJson(Map<String, dynamic> json){
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
  });
  late final String id;
  late final Attributes attributes;

  Data.fromJson(Map<String, dynamic> json){
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
    required this.rotationX,
    required this.rotationY,
    required this.rotationZ,
    required this.ultrasonic,
  });
  late final String rotationX;
  late final String rotationY;
  late final String rotationZ;
  late final String ultrasonic;

  Attributes.fromJson(Map<String, dynamic> json){
    rotationX = json['rotation_x'];
    rotationY = json['rotation_y'];
    rotationZ = json['rotation_z'];
    ultrasonic = json['ultrasonic'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rotation_x'] = rotationX;
    _data['rotation_y'] = rotationY;
    _data['rotation_z'] = rotationZ;
    _data['ultrasonic'] = ultrasonic;
    return _data;
  }
}