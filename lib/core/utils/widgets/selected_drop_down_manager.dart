import 'package:flutter/foundation.dart';

class SelectedDropDownManager extends ChangeNotifier {
  int? selectedIndex;

  void selectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  bool isIndexSelected(int index) {
    return selectedIndex == index;
  }
}
