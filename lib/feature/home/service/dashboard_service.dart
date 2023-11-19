import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/core/service/constant.dart';
import 'package:gloria_test_case/feature/home/model/people_count_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IDasboardService {
  Future<List<PeopleCountModel>?> fetchPeopleCount(int range, int placeId);
  Future<List<PeopleCountModel>?> fetchSpecificDateCount(
      String firstDate, String lastDate, int placeId);
}

class DashBoardService extends IDasboardService {
  @override
  Future<List<PeopleCountModel>?> fetchPeopleCount(int range, int placeId) async {
    try {
      final response = await supabase
          .from(TableName.placePeopleCount.tableName)
          .select()
          .eq('place_id', placeId)
          .neq('created_at', DateTime.now().toIso8601String())
          .order('created_at', ascending: true)
          .limit(range);
      if (response is List) {
        final data = response.map((e) => PeopleCountModel.fromJson(e)).toList();
        return data;
      }
    } on PostgrestException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }

    return null;
  }

  @override
  Future<List<PeopleCountModel>?> fetchSpecificDateCount(
      String firstDate, String lastDate, int placeId) async {
    try {
      final response = await supabase
          .from(TableName.placePeopleCount.tableName)
          .select()
          .eq('place_id', placeId)
          .lte('created_at', lastDate)
          .gte('created_at', firstDate)
          .order('created_at', ascending: true);
      if (response is List) {
        final data = response.map((e) => PeopleCountModel.fromJson(e)).toList();
        return data;
      }
    } on PostgrestException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }
}
