class NotificationModel {
  final String title;
  final String message;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    this.isRead = false,
  });

  NotificationModel copyWith({
    String? title,
    String? message,
    bool? isRead,
  }) {
    return NotificationModel(
      title: title ?? this.title,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
    );
  }
}
