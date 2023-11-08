class CityEntity {
  int cityId;
  String cityName;

  CityEntity({
    required this.cityId,
    required this.cityName,
  });

  factory CityEntity.fromResponse(Map<String, dynamic> json) {
    return CityEntity(
      cityId: json['cityId'] ?? -1,
      cityName: json['cityName'] ?? "",
    );
  }
}
