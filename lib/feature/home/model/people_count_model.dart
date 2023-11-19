// ignore_for_file: public_member_api_docs, sort_constructors_first

class PeopleCountModel {
  final int placeId;
  final int peopleCount;
  final DateTime createdTime;
  PeopleCountModel({
    required this.placeId,
    required this.peopleCount,
    required this.createdTime,
  });
  factory PeopleCountModel.fromJson(Map<String, dynamic> json) {
    return PeopleCountModel(
      placeId: json['place_id'],
      peopleCount: json['people_count'],
      createdTime: DateTime.parse(json['created_at']),
    );
  }
}
