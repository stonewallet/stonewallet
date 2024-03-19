import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  Set<int> expandedIndices = {};

  void toggleExpansion(int index) {
    if (expandedIndices.contains(index)) {
      expandedIndices.remove(index); // Collapse the notification
    } else {
      expandedIndices.clear(); // Collapse other notifications
      expandedIndices.add(index); // Expand the tapped notification
    }
    notifyListeners();
  }
}