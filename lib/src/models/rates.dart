class Rates {
  String title;
  num value;

  Rates({
    this.title,
    this.value,
  });

  factory Rates.fromJson(Map<String, dynamic> json) {
    return Rates(
      title: json['title'],
      value: json['value'],
    );
  }
}
