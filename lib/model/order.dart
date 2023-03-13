class Order {
  String? phone;
  String? instagram;
  String? telegram;
  String? information;
  Map<String, List<String>> convenientTime;

  Order({
    this.phone,
    this.instagram,
    this.telegram,
    this.information,
  }) : convenientTime = {
          'Ежедневно': ['', ''],
          'Будние дни': ['', ''],
          'Выходные дни': ['', ''],
          'Понедельник': ['', ''],
          'Вторник': ['', ''],
          'Среда': ['', ''],
          'Четверг': ['', ''],
          'Пятница': ['', ''],
          'Суббота': ['', ''],
          'Воскресенье': ['', ''],
        };
}
