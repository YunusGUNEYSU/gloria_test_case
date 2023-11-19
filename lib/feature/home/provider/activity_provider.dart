import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/feature/home/model/activity.dart';
import 'package:gloria_test_case/feature/home/service/activity_service.dart';

class ActivityProvider extends ChangeNotifier {
  ActivityProvider({required this.iActivityService});
  IActivityService iActivityService;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoading(bool val) => _isLoading = val;
  List<ActivityModel> _activityList = [];
  List<ActivityModel> get activityList => _activityList;
  late List<ActivityModel> filterEvents = _activityList;

  Future<void> fetchAllActivity() async {
    setLoading = true;
    _activityList = await iActivityService.fetchAllActivity() ?? [];
    setLoading = false;
    notifyListeners();
  }

  void searchEvents(String query) {
    final input = query.toLowerCase();
    final filter = _activityList
        .where((element) => element.activityName.toLowerCase().contains(input))
        .toList();
    filterEvents = filter;
    notifyListeners();
  }
}
