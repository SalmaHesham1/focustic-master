class ExercisesModel {
  final List<Data>? data;

  ExercisesModel({
    this.data,
  });

  ExercisesModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'data': data?.map((e) => e.toJson()).toList()};
}

class Data {
  final String? id;
  final Attributes1? attributes;
  final Relationships? relationships;

  Data({
    this.id,
    this.attributes,
    this.relationships,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        attributes = (json['attributes'] as Map<String, dynamic>?) != null
            ? Attributes1.fromJson(json['attributes'] as Map<String, dynamic>)
            : null,
        relationships = (json['relationships'] as Map<String, dynamic>?) != null
            ? Relationships.fromJson(
                json['relationships'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes?.toJson(),
        'relationships': relationships?.toJson()
      };
}

class Attributes1 {
  final String? name;

  Attributes1({
    this.name,
  });

  Attributes1.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'name': name};
}

class Relationships {
  final List<Exercise>? exercise;

  Relationships({
    this.exercise,
  });

  Relationships.fromJson(Map<String, dynamic> json)
      : exercise = (json['Exercise'] as List?)
            ?.map((dynamic e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'Exercise': exercise?.map((e) => e.toJson()).toList()};
}

class Exercise {
  final String? id;
  final Attributes? attributes;
  final Relationships2? relationships;

  Exercise({
    this.id,
    this.attributes,
    this.relationships,
  });

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        attributes = (json['attributes'] as Map<String, dynamic>?) != null
            ? Attributes.fromJson(json['attributes'] as Map<String, dynamic>)
            : null,
        relationships = (json['relationships'] as Map<String, dynamic>?) != null
            ? Relationships2.fromJson(
                json['relationships'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes?.toJson(),
        'relationships': relationships?.toJson()
      };
}

class Attributes {
  final String? name;
  final String? cover;
  final String? description;
  final String? bodyPart;
  final String? repetitions;
  final String? sets;
  final String? duration;
  final String? link;

  Attributes({
    this.name,
    this.cover,
    this.description,
    this.bodyPart,
    this.repetitions,
    this.sets,
    this.duration,
    this.link,
  });

  Attributes.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        cover = json['cover'] as String?,
        description = json['description'] as String?,
        bodyPart = json['bodyPart'] as String?,
        repetitions = json['repetitions'] as String?,
        sets = json['sets'] as String?,
        duration = json['duration'] as String?,
        link = json['link'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'cover': cover,
        'description': description,
        'bodyPart': bodyPart,
        'repetitions': repetitions,
        'sets': sets,
        'duration': duration,
        'link': link
      };
}

class Relationships2 {
  final Category? category;

  Relationships2({
    this.category,
  });

  Relationships2.fromJson(Map<String, dynamic> json)
      : category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'category': category?.toJson()};
}

class Category {
  final int? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
