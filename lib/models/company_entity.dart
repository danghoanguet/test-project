import 'package:tesstprovicer/data/data.dart';
import 'package:tesstprovicer/widgets/base_body.dart';

class CompanyEntity extends BaseEntity {
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
  @override
  String get getSearchId => companyCode;

  @override
  String get getSearchName => companyName;

  @override
  String? get getImageUrl => null;

  @override
  List<BaseEntity> getData() {
    List<CompanyEntity> res = [];
    for (var country in Data.company) {
      res.add(CompanyEntity.fromResponse(country));
    }
    return res;
  }
}
