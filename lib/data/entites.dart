import 'package:tesstprovicer/data/data.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';
import 'package:tesstprovicer/models/country_entity.dart';

class Entites {
  static List<CountryEntity> getCountryData() {
    List<CountryEntity> res = [];
    for (var country in Data.country) {
      res.add(CountryEntity.fromResponse(country));
    }
    return res;
  }

  static List<CompanyEntity> getCompanyData() {
    List<CompanyEntity> res = [];
    for (var country in Data.company) {
      res.add(CompanyEntity.fromResponse(country));
    }
    return res;
  }

  static List<CityEntity> getCityData() {
    List<CityEntity> res = [];
    for (var country in Data.city) {
      res.add(CityEntity.fromResponse(country));
    }
    return res;
  }
}
