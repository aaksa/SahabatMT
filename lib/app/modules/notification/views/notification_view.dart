import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sahabatmt/app/constants/constants.dart';
import 'package:sahabatmt/app/modules/widgets/appbarviews.dart';

import '../../../data/notificationmodel.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends StatelessWidget {
  final NotificationController notificationsController =
      Get.put(NotificationController());

  NotificationController notificationController = Get.find();
  NotificationModel newNotification = NotificationModel(
    title: "New Notification",
    message: "You have a new notification!",
    isRead: false,
  );

  @override
  Widget build(BuildContext context) {
    notificationController.addNotification(newNotification);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryTextColor),
        backgroundColor: kBackgroundColor1,
        title: appbarviews(
          title: "Notifikasi",
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: notificationsController.notifications.length,
          itemBuilder: (context, index) {
            final notification = notificationsController.notifications[index];
            return ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              leading: CircleAvatar(
                child: Icon(
                  notification.isRead
                      ? Icons.check
                      : Icons.notification_important,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.mark_email_read_outlined),
                onPressed: () =>
                    notificationsController.markAsRead(notification),
              ),
            );
          },
        ),
      ),
    );
  }
}
