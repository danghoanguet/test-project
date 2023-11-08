class CompanyEntity {
  String companyCode;
  String companyName;
  String companyAddress;

  CompanyEntity({
    required this.companyCode,
    required this.companyName,
    required this.companyAddress,
  });

  factory CompanyEntity.fromResponse(Map<String, dynamic> json) {
    return CompanyEntity(
      companyCode: json['companyCode'] ?? "",
      companyName: json['companyName'] ?? "",
      companyAddress: json['companyAddress'] ?? "",
    );
  }
}
