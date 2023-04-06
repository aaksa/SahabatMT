import 'package:get/get.dart';

import '../../../data/notificationmodel.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  void markAsRead(NotificationModel notification) {
    final index = notifications.indexWhere((n) => n == notification);
    if (index != -1) {
      final updatedNotification = notification.copyWith(isRead: true);
      notifications[index] = updatedNotification;
    }
  }

  void addNotification(NotificationModel notification) {
    notifications.add(notification);
  }

  void markAsUnread(NotificationModel notification) {
    final index = notifications.indexWhere((n) => n == notification);
    if (index != -1) {
      final updatedNotification = notification.copyWith(isRead: false);
      notifications[index] = updatedNotification;
    }
  }
}
