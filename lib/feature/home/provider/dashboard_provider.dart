import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/error/error_message.dart';
import 'package:gloria_test_case/core/extension/date.dart';
import 'package:gloria_test_case/feature/home/model/people_count_model.dart';
import 'package:gloria_test_case/feature/home/service/dashboard_service.dart';

import '../model/date_filter.dart';

class DashBoardProvider extends ChangeNotifier {
  DashBoardProvider({required this.iDasboardService});
  List<DateSelect> dateFilter = [
    DateSelect.yesterday,
    DateSelect.lastWeek,
  ];
  ErrorMessage? errorMessage;
  int? selectedIndex = 0;
  DateSelect _dateSelect = DateSelect.yesterday;
  DateSelect get dateSelect => _dateSelect;
  List<PeopleCountModel> _peopleList = [];
  List<PeopleCountModel> get peopleList => _peopleList;
  IDasboardService iDasboardService;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoading(bool val) => _isLoading = val;
  int? _placeID;
  int get placeId => _placeID ?? 0;
  DateTimeRange? _dateTimeRange;
  DateTimeRange? get dateTimeRange => _dateTimeRange;
  bool _isNoselect = false;
  bool get isNoSelect => _isNoselect;
  int range = 0;
  List<double> graphY = [];

  void checkSelect(String text) {
    if (selectedIndex == null || text.isEmpty) {
      _isNoselect = true;
    } else {
      _isNoselect = false;
    }
    notifyListeners();
  }

  void setPlaceName(int placeID) {
    _placeID = placeID;
    notifyListeners();
  }

  void selectChip(bool isSelected, int index) {
    selectedIndex = isSelected ? index : null;
    notifyListeners();
  }

  Future<void> selectedDate(DateSelect dateSelect) async {
    _dateTimeRange = null;
    _dateSelect = dateSelect;
    _getCountRange();
    notifyListeners();
  }

  void _getCountRange() {
    if (dateSelect == DateSelect.yesterday) {
      range = 1;
    } else if (dateSelect == DateSelect.lastWeek) {
      range = 7;
    }
    notifyListeners();
  }

  Future<void> fetchPeopleCount() async {
    int rangevalue = range;
    _peopleList.clear();
    setLoading = true;
    _peopleList = await iDasboardService.fetchPeopleCount(rangevalue, placeId) ?? [];
    setLoading = false;
    if (_peopleList.isEmpty) {
      errorMessage = ErrorMessage(message: 'Not found Data');
    }
    notifyListeners();
  }

  Future<void> fetchDataControl() async {
    if (selectedIndex == null) {
      await fetchWithDateRangeCount();
    } else {
      await fetchPeopleCount();
    }
  }

  void changeGraphY() {
    graphY = _peopleList.map((e) => e.peopleCount.toDouble()).toList();
    graphY.sort();
    graphY = graphY.reversed.toList();
    notifyListeners();
  }

  Future<void> showDateRange(BuildContext context) async {
    selectedIndex = null;
    DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (dateRange == null) return;
    _dateTimeRange = dateRange;
    notifyListeners();
  }

  Future<void> fetchWithDateRangeCount() async {
    setLoading = true;
    _peopleList.clear();
    _peopleList = await iDasboardService.fetchSpecificDateCount(
            dateTimeRange?.start.convertYMD ?? '', dateTimeRange?.end.convertYMD ?? '', placeId) ??
        [];
    setLoading = false;
    if (_peopleList.isEmpty) {
      errorMessage = ErrorMessage(message: 'Not found Data');
    }
    notifyListeners();
  }
}
