import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/feature/home/model/place.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/service/constant.dart';

abstract interface class IPlaceService {
  Future<List<PlaceModel>?> fetchPlace();
}

class PlaceService extends IPlaceService {
  @override
  Future<List<PlaceModel>?> fetchPlace() async {
    try {
      final response = await supabase.from(TableName.place.tableName).select("*,activity(*)");
      if (response != null) {
        if (response is List) {
          final result = response.map((e) => PlaceModel.fromJson(e)).toList();
          return result;
        }
      }
    } on PostgrestException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }
}
