import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}
