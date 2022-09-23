import '../database_helper.dart';

class Name{
  int? id;
  String name;

  Name({ required this.id, required this.name});
  Name.fromMap(Map<String, dynamic> map) :
        id = map[DatabaseHelper.columnId],
        name = map[DatabaseHelper.columnName];
}