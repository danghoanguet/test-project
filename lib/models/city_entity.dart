import 'package:tesstprovicer/data/data.dart';
import 'package:tesstprovicer/widgets/base_body.dart';

class CityEntity extends BaseEntity {
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
  @override
  String get getSearchId => cityId.toString();

  @override
  String get getSearchName => cityName;

  @override
  String? get getImageUrl => null;

  @override
  List<BaseEntity> getData() {
    List<CityEntity> res = [];
    for (var country in Data.city) {
      res.add(CityEntity.fromResponse(country));
    }
    return res;
  }
}
