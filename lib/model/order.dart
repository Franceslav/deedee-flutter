class Order {
  String? phone;
  String? instagram;
  String? telegram;
  String? information;
  Map<String, List<String>>? convenientTime;

  Order({
    this.phone,
    this.instagram,
    this.telegram,
    this.information,
  }) : convenientTime = {
          'Daily': ['', ''],
          'Weekdays': ['', ''],
          'Weekends': ['', ''],
          'Monday': ['', ''],
          'Tuesday': ['', ''],
          'Wednesday': ['', ''],
          'Thursday': ['', ''],
          'Friday': ['', ''],
          'Saturday': ['', ''],
          'Sunday': ['', ''],
        };
}
