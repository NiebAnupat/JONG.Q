import 'package:intl/intl.dart';

class AppTime {
  static String getTimestamp() {
    // Get the current UTC time
    DateTime utcNow = DateTime.now().toUtc();

    // Define the time zone offset (GMT+7)
    Duration gmt7Offset = Duration(hours: 7);

    // Calculate the local time with the GMT+7 offset
    DateTime gmt7Time = utcNow.add(gmt7Offset);

    // Format the local time as a string
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(gmt7Time);

    return formattedTime;
  }
}
