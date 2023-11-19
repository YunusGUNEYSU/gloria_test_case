import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

enum TableName {
  place('places'),
  activity('activity'),
  placePeopleCount('place_people_count'),
  user('users');

  final String tableName;
  const TableName(this.tableName);
}
