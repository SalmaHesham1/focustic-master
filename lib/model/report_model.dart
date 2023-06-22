class ReportModel {
  ReportModel({
    required this.id,
    required this.week,
    required this.attributes,
  });

  late final int id;
  late final int week;
  late final Attributes attributes;

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    week = json['week'];
    attributes = Attributes.fromJson(json['attributes']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['week'] = week;
    _data['attributes'] = attributes.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.allTasks,
    required this.completedTasks,
    required this.activeTasks,
    required this.allSessions,
    required this.completedSession,
    required this.activeSessions,
    required this.spentHours,
  });

  late final String allTasks;
  late final String completedTasks;
  late final String activeTasks;
  late final String allSessions;
  late final String completedSession;
  late final String activeSessions;
  late final int spentHours;

  Attributes.fromJson(Map<String, dynamic> json) {
    allTasks = json['all_tasks'];
    completedTasks = json['completed_tasks'];
    activeTasks = json['active_tasks'];
    allSessions = json['all_sessions'];
    completedSession = json['completed_session'];
    activeSessions = json['active_sessions'];
    spentHours = json['spent_hours'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all_tasks'] = allTasks;
    _data['completed_tasks'] = completedTasks;
    _data['active_tasks'] = activeTasks;
    _data['all_sessions'] = allSessions;
    _data['completed_session'] = completedSession;
    _data['active_sessions'] = activeSessions;
    _data['spent_hours'] = spentHours;
    return _data;
  }
}
