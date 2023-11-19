import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/core/service/constant.dart';
import 'package:gloria_test_case/feature/home/model/activity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IActivityService {
  Future<List<ActivityModel>?> fetchAllActivity();
}

class ActivityService extends IActivityService {
  @override
  Future<List<ActivityModel>?> fetchAllActivity() async {
    try {
      final response =
          await supabase.from(TableName.activity.tableName).select('*,places("place_name")');
      if (response is List) {
        final data = response.map((e) => ActivityModel.fromAll(e)).toList();
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
