import 'package:intl/intl.dart';

class Todo {
  Todo({required this.name, required this.checked});

  final String name;
  bool checked;
  String tdata = DateFormat("hh:mm a").format(DateTime.now());
}