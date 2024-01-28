import 'dart:math';

String formatDateTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
  } else if (difference.inHours < 24 && now.day == dateTime.day) {
    return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
  } else if (difference.inDays == 1) {
    return 'yesterday';
  } else {
    // Format as 'dd.MM.yyyy'
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
  }
}