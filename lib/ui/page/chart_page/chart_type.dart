enum ChartType {
  line('Lines'),
  bar('Bar');

  final String value;
  const ChartType(this.value);

  static ChartType fromString(String value) {
    return ChartType.values.firstWhere((e) => e.value == value);
  }
}
