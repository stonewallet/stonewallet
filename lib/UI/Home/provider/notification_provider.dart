import 'package:flutter/material.dart';
import 'package:stone_wallet_main/UI/Model/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  Set<int> expandedIndices = {};
  List<NotificationModel> notifications = [];
  
  void setNotifications(List<NotificationModel> newList) {
    notifications = newList;
    notifyListeners();
  }
    void removeNotification(int index) {
    notifications.removeAt(index);
    notifyListeners();
  }

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