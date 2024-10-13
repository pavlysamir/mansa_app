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

class SelectedMultipleDropDownManager extends ChangeNotifier {
  // Store multiple selected indices
  List<int> selectedIndices = [];

  // Allow selecting up to 4 indices
  void selectIndex(int index) {
    if (selectedIndices.contains(index)) {
      // If the index is already selected, unselect it
      selectedIndices.remove(index);
    } else if (selectedIndices.length < 4) {
      // Add the index if it's not selected and less than 4 items are selected
      selectedIndices.add(index);
    } else {
      // Optionally handle case when user tries to select more than 4 items
      if (kDebugMode) {
        print('Cannot select more than 4 items');
      }
    }
    notifyListeners();
  }

  // Check if an index is selected
  bool isIndexSelected(int index) {
    return selectedIndices.contains(index);
  }
}
