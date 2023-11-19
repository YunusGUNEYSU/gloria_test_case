import 'package:flutter/foundation.dart';
import 'package:gloria_test_case/feature/home/model/place.dart';
import 'package:gloria_test_case/feature/home/service/place_service.dart';

final class HomeProvider extends ChangeNotifier {
  HomeProvider({required this.iPlaceService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsloading(bool loading) => _isLoading = loading;
  List<PlaceModel>? _places = [];
  List<PlaceModel>? get places => _places;
  IPlaceService iPlaceService;
 late List<PlaceModel>? filterPlace = _places;

  void searchPlaces(String query) {
    final input = query.toLowerCase();
    final filter = _places
        ?.where((element) => element.placeName.toLowerCase().contains(input))
        .toList();
    filterPlace = filter;
    notifyListeners();
  }
  Future<void> fetchPlace() async {
    setIsloading = true;
    _places = await iPlaceService.fetchPlace();
    setIsloading = false;
    notifyListeners();
  }
}
