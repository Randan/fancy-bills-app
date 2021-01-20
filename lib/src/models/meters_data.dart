class MetersData {
  String date;
  double coldWater;
  double hotWater;
  double electricity;

  MetersData({
    this.date,
    this.coldWater,
    this.hotWater,
    this.electricity,
  });

  factory MetersData.fromJson(Map<String, dynamic> json) {
    return MetersData(
      date: json['date'],
      coldWater: json['coldWater'],
      hotWater: json['hotWater'],
      electricity: json['electricity'],
    );
  }
}
