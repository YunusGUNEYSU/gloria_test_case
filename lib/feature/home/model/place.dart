import 'package:gloria_test_case/feature/home/model/activity.dart';

class PlaceModel {
  final int placeId;
  final String placeName;
  final String placeType;
  int capacity;
  String workHours;
  final List<ActivityModel> activities;
  PlaceModel(
      {required this.placeName,
      required this.placeType,
      required this.capacity,
      required this.workHours,
      required this.activities,
      required this.placeId});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['id'],
      placeName: json['place_name'],
      placeType: json['place_type'],
      capacity: json['capacity'],
      workHours: json['work_hours'],
      activities: List<ActivityModel>.from(
        json['activity'].map<ActivityModel>(
          (x) => ActivityModel.fromJson(x),
        ),
      ),
    );
  }
}
