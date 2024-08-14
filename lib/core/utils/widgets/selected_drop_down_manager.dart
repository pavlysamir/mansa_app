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

class SelectedSearchDropDownManager extends ChangeNotifier {
  int? selectedIndex;

  void toggleIndex(int index) {
    if (selectedIndex == index) {
      // Deselect the index if it is already selected
      selectedIndex = -1;
    } else {
      // Select the new index
      selectedIndex = index;
    }
    notifyListeners();
  }

  bool isIndexSelected(int index) {
    return selectedIndex == index;
  }
}
