import 'package:tesstprovicer/data/entites.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';
import 'package:tesstprovicer/models/country_entity.dart';
import 'package:tesstprovicer/widgets/base_body.dart';

class Data {
  static const country = [
    {
      "countryId": 41,
      "countryCode": "AFG",
      "countryName": "Afghanistan",
      "countryFlag": null
    },
    {
      "countryId": 42,
      "countryCode": "ALA",
      "countryName": "Åland Islands",
      "countryFlag": null
    },
    {
      "countryId": 43,
      "countryCode": "ALB",
      "countryName": "Albania",
      "countryFlag": null
    },
    {
      "countryId": 44,
      "countryCode": "DZA",
      "countryName": "Algeria",
      "countryFlag": null
    },
    {
      "countryId": 45,
      "countryCode": "ASM",
      "countryName": "American Samoa",
      "countryFlag":
          "https://www.britannica.com/topic/flag-of-the-United-States-of-America"
    },
    {
      "countryId": 46,
      "countryCode": "AND",
      "countryName": "Andorra",
      "countryFlag": null
    },
    {
      "countryId": 47,
      "countryCode": "AGO",
      "countryName": "Angola",
      "countryFlag": null
    },
    {
      "countryId": 48,
      "countryCode": "AIA",
      "countryName": "Anguilla",
      "countryFlag": null
    },
    {
      "countryId": 49,
      "countryCode": "ATA",
      "countryName": "Antarctica",
      "countryFlag": null
    },
    {
      "countryId": 50,
      "countryCode": "ATG",
      "countryName": "Antigua and Barbuda",
      "countryFlag": null
    },
    {
      "countryId": 51,
      "countryCode": "ARG",
      "countryName": "Argentina",
      "countryFlag": null
    },
    {
      "countryId": 52,
      "countryCode": "ARM",
      "countryName": "Armenia",
      "countryFlag": null
    },
    {
      "countryId": 53,
      "countryCode": "ABW",
      "countryName": "Aruba",
      "countryFlag": null
    },
    {
      "countryId": 54,
      "countryCode": "AUS",
      "countryName": "Australia",
      "countryFlag": null
    },
    {
      "countryId": 55,
      "countryCode": "AUT",
      "countryName": "Austria",
      "countryFlag": null
    },
    {
      "countryId": 56,
      "countryCode": "AZE",
      "countryName": "Azerbaijan",
      "countryFlag": null
    },
    {
      "countryId": 57,
      "countryCode": "BHS",
      "countryName": "Bahamas",
      "countryFlag": null
    },
    {
      "countryId": 58,
      "countryCode": "BHR",
      "countryName": "Bahrain",
      "countryFlag": null
    },
    {
      "countryId": 59,
      "countryCode": "BGD",
      "countryName": "Bangladesh",
      "countryFlag": null
    },
    {
      "countryId": 60,
      "countryCode": "BRB",
      "countryName": "Barbados",
      "countryFlag": null
    },
    {
      "countryId": 61,
      "countryCode": "BLR",
      "countryName": "Belarus",
      "countryFlag": null
    },
    {
      "countryId": 62,
      "countryCode": "BEL",
      "countryName": "Belgium",
      "countryFlag": null
    },
    {
      "countryId": 63,
      "countryCode": "BLZ",
      "countryName": "Belize",
      "countryFlag": null
    },
    {
      "countryId": 64,
      "countryCode": "BEN",
      "countryName": "Benin",
      "countryFlag": null
    },
    {
      "countryId": 65,
      "countryCode": "BMU",
      "countryName": "Bermuda",
      "countryFlag": null
    },
    {
      "countryId": 66,
      "countryCode": "BTN",
      "countryName": "Bhutan",
      "countryFlag": null
    },
    {
      "countryId": 67,
      "countryCode": "BOL",
      "countryName": "Bolivia (Plurinational State of)",
      "countryFlag": null
    },
    {
      "countryId": 68,
      "countryCode": "BES",
      "countryName": "Bonaire, Saint Eustatius And Saba",
      "countryFlag": null
    },
    {
      "countryId": 69,
      "countryCode": "BIH",
      "countryName": "Bosnia and Herzegovina",
      "countryFlag": null
    },
    {
      "countryId": 70,
      "countryCode": "BWA",
      "countryName": "Botswana",
      "countryFlag": null
    },
    {
      "countryId": 71,
      "countryCode": "BVT",
      "countryName": "Bouvet Island",
      "countryFlag": null
    },
    {
      "countryId": 72,
      "countryCode": "BRA",
      "countryName": "Brazil",
      "countryFlag": null
    },
    {
      "countryId": 73,
      "countryCode": "IOT",
      "countryName": "British Indian Ocean Territory",
      "countryFlag": null
    },
    {
      "countryId": 74,
      "countryCode": "BRN",
      "countryName": "Brunei Darussalam",
      "countryFlag": null
    },
    {
      "countryId": 75,
      "countryCode": "BGR",
      "countryName": "Bulgaria",
      "countryFlag": null
    },
    {
      "countryId": 76,
      "countryCode": "BFA",
      "countryName": "Burkina Faso",
      "countryFlag": null
    },
    {
      "countryId": 77,
      "countryCode": "BDI",
      "countryName": "Burundi",
      "countryFlag": null
    },
    {
      "countryId": 78,
      "countryCode": "CPV",
      "countryName": "Cabo Verde",
      "countryFlag": null
    },
    {
      "countryId": 79,
      "countryCode": "CMR",
      "countryName": "Cameroon",
      "countryFlag": null
    },
    {
      "countryId": 80,
      "countryCode": "CAN",
      "countryName": "Canada",
      "countryFlag": null
    },
    {
      "countryId": 81,
      "countryCode": "CYM",
      "countryName": "Cayman Islands",
      "countryFlag": null
    },
    {
      "countryId": 82,
      "countryCode": "CAF",
      "countryName": "Central African Republic",
      "countryFlag": null
    }
  ];
  static const company = [
    {
      "companyCode": "PRASAC",
      "companyName": "Prasac Company",
      "companyAddress": "Phnom Penh"
    },
    {
      "companyCode": "PRAZIC",
      "companyName": "Prazic Company",
      "companyAddress": "Kampnong Thom"
    },
    {
      "companyCode": "ARGI",
      "companyName": "Argi Company",
      "companyAddress": "Stung Treng"
    },
    {
      "companyCode": "CTAP",
      "companyName": "Ctap Company",
      "companyAddress": "Kampong Cham"
    },
    {
      "companyCode": "BUCRL",
      "companyName": "Bucrl Company",
      "companyAddress": "Tboung Khmum"
    },
    {
      "companyCode": "PANOK",
      "companyName": "Panok Company",
      "companyAddress": "Mondulkiri"
    },
    {
      "companyCode": "NATC",
      "companyName": "NatC Company",
      "companyAddress": "Pursat"
    }
  ];
  static const city = [
    {"cityId": 1, "cityName": "Phnom Penh"},
    {"cityId": 21, "cityName": "Banteay Meanchey"},
    {"cityId": 22, "cityName": "Battambang"},
    {"cityId": 23, "cityName": "Kampong Cham"},
    {"cityId": 24, "cityName": "Kampong Chhnang"},
    {"cityId": 25, "cityName": "Kampong Speu"},
    {"cityId": 26, "cityName": "Kampong Thom"},
    {"cityId": 27, "cityName": "Kampot"},
    {"cityId": 28, "cityName": "Kandal"},
    {"cityId": 29, "cityName": "Koh Kong"},
    {"cityId": 30, "cityName": "Kratié"},
    {"cityId": 32, "cityName": "Preah Vihear"},
    {"cityId": 33, "cityName": "Prey Veng"},
    {"cityId": 34, "cityName": "Pursat"},
    {"cityId": 36, "cityName": "Siem Reap"},
    {"cityId": 37, "cityName": "Preah Sihanouk"},
    {"cityId": 38, "cityName": "Stung Treng"},
    {"cityId": 39, "cityName": "Svay Rieng"},
    {"cityId": 41, "cityName": "Oddar Meanchey"},
    {"cityId": 42, "cityName": "Kep"},
    {"cityId": 43, "cityName": "Pailin"},
    {"cityId": 44, "cityName": "Tboung Khmum"},
    {"cityId": 45, "cityName": "Takeo"},
    {"cityId": 46, "cityName": "Ratanak Kiri"},
    {"cityId": 48, "cityName": "Mondul Kiri"},
    {"cityId": 49, "cityName": "Kracheh"},
    {"cityId": 53, "cityName": "Kompong Speu"}
  ];

  static List<BaseEntity> getData<T extends BaseEntity>() {
    switch (T) {
      case CountryEntity:
        {
          return Entites.getCountryData();
        }
      case CityEntity:
        {
          return Entites.getCityData();
        }
      case CompanyEntity:
        {
          return Entites.getCompanyData();
        }
    }

    return <T>[];
  }
}
