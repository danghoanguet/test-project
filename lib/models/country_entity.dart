class CountryEntity {
  int countryId;
  String countryCode;
  String countryName;
  String countryFlag;

  CountryEntity(
      {required this.countryId,
      required this.countryCode,
      required this.countryName,
      required this.countryFlag});

  factory CountryEntity.fromResponse(Map<String, dynamic> json) {
    return CountryEntity(
      countryId: json['countryId'] ?? "",
      countryCode: json['countryCode'] ?? "",
      countryName: json['countryName'] ?? "",
      countryFlag: json['countryFlag'] ?? "",
    );
  }
}
