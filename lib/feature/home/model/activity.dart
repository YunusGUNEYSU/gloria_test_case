// ignore_for_file: public_member_api_docs, sort_constructors_first

class ActivityModel {
  final int placeId;
  final String activityName;
  final String acitivityType;
  int capacity;
  DateTime activityDate;
  final String? placeName;
  ActivityModel(
      {required this.placeId,
      required this.activityName,
      required this.acitivityType,
      required this.capacity,
      required this.activityDate,
      this.placeName});

  factory ActivityModel.fromJson(Map<String, dynamic> map) {
    return ActivityModel(
      placeId: map['place_id'],
      activityName: map['activity_name'],
      acitivityType: map['activity_type'],
      capacity: map['capacity'],
      activityDate: DateTime.parse(
        map['datetime'],
      ),
    );
  }
  factory ActivityModel.fromAll(Map<String, dynamic> map) {
    return ActivityModel(
      placeId: map['place_id'],
      activityName: map['activity_name'],
      acitivityType: map['activity_type'],
      capacity: map['capacity'],
      activityDate: DateTime.parse(
        map['datetime'],
      ),
      placeName: map['places']['place_name'],
    );
  }
}
