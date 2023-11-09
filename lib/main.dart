import 'package:flutter/material.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';
import 'package:tesstprovicer/models/country_entity.dart';
import 'package:tesstprovicer/ultis/ultis.dart';
import 'package:tesstprovicer/widgets/base_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Test'),
          ),
          body: const HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountryEntity? countryEntity;
  CompanyEntity? companyEntity;
  CityEntity? cityEntity;
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Country: ${countryEntity?.countryName}"),
              const SizedBox(
                height: 12,
              ),
              Text("Company: ${companyEntity?.companyName}"),
              const SizedBox(
                height: 12,
              ),
              Text("City: ${cityEntity?.cityName}"),
              const SizedBox(
                height: 12,
              ),
              baseTextField(
                controller: _countryController,
                hintText: 'Select country',
                onTap: () {
                  onTapTextField(
                    context,
                    BaseBody<CountryEntity>(
                      currentEntity: countryEntity,
                      title: "Country",
                      hasFilter: true,
                      onTap: (entity) {
                        onChooseItemCallBack(entity);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              baseTextField(
                controller: _companyController,
                hintText: 'Select company',
                onTap: () {
                  onTapTextField(
                    context,
                    BaseBody<CompanyEntity>(
                      currentEntity: companyEntity,
                      title: "Company",
                      hasFilter: true,
                      onTap: (entity) {
                        onChooseItemCallBack(entity);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              baseTextField(
                controller: _cityController,
                hintText: 'Select city',
                onTap: () {
                  onTapTextField(
                    context,
                    BaseBody<CityEntity>(
                      currentEntity: cityEntity,
                      title: "City",
                      hasFilter: true,
                      onTap: (entity) {
                        onChooseItemCallBack(entity);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapTextField(BuildContext context, Widget body) {
    showBottomSheetBase(context, body: body);
  }

  void onChooseItemCallBack(dynamic entity) {
    setState(() {
      if (entity is CountryEntity) {
        final CountryEntity country = entity;
        countryEntity = country;
        _countryController.text = country.countryName;
        return;
      }
      if (entity is CompanyEntity) {
        final CompanyEntity company = entity;
        companyEntity = company;
        _companyController.text = company.companyName;
        return;
      }
      if (entity is CityEntity) {
        final CityEntity city = entity;
        cityEntity = city;
        _cityController.text = city.cityName;
        return;
      }
    });
  }

  Widget baseTextField({
    required TextEditingController controller,
    String? hintText,
    TextStyle? hintStyle,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
            suffixIcon: const Icon(
              Icons.arrow_drop_down_sharp,
              size: 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
