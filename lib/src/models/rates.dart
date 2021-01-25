class Rates {
  num rent;
  num coldWater;
  num hotWater;
  num sewerage;
  num electricityBelow;
  num electricityAbove;

  Rates({
    this.rent,
    this.coldWater,
    this.hotWater,
    this.sewerage,
    this.electricityBelow,
    this.electricityAbove,
  });

  factory Rates.fromJson(Map<String, dynamic> json) {
    return Rates(
      rent: json['rent'],
      coldWater: json['coldWater'],
      hotWater: json['hotWater'],
      sewerage: json['sewerage'],
      electricityBelow: json['electricityBelow'],
      electricityAbove: json['electricityAbove'],
    );
  }
}
