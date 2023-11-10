import 'package:flutter/material.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';
import 'package:tesstprovicer/models/country_entity.dart';
import 'package:tesstprovicer/ultis/ultis.dart';
import 'package:tesstprovicer/widgets/base_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
          body: HomeScreen()),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _countryProvider = StateProvider<CountryEntity?>((_) => null);
  final _companyProvider = StateProvider<CompanyEntity?>((_) => null);
  final _cityProvider = StateProvider<CityEntity?>((_) => null);

  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Text("Country: ${ref.watch(_countryProvider)?.countryCode}"),
              const SizedBox(
                height: 12,
              ),
              Text("Company: ${ref.watch(_companyProvider)?.companyCode}"),
              const SizedBox(
                height: 12,
              ),
              Text("City: ${ref.watch(_cityProvider)?.cityId}"),
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
                      currentEntity: ref.read(_countryProvider),
                      title: "Country",
                      hasFilter: true,
                      onTap: (entity) {
                        onChooseItemCallBack(entity, ref);
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
                      currentEntity: ref.read(_companyProvider),
                      title: "Company",
                      onTap: (entity) {
                        onChooseItemCallBack(entity, ref);
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
                      currentEntity: ref.read(_cityProvider),
                      title: "City",
                      onTap: (entity) {
                        onChooseItemCallBack(entity, ref);
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

  void onChooseItemCallBack(dynamic entity, WidgetRef ref) {
    // setState(() {
    if (entity is CountryEntity) {
      final CountryEntity country = entity;
      ref.read(_countryProvider.notifier).state = country;
      // countryEntity = country;
      _countryController.text = country.countryName;
      return;
    }
    if (entity is CompanyEntity) {
      final CompanyEntity company = entity;
      ref.read(_companyProvider.notifier).state = company;
      // companyEntity = company;
      _companyController.text = company.companyName;
      return;
    }
    if (entity is CityEntity) {
      final CityEntity city = entity;
      ref.read(_cityProvider.notifier).state = city;
      // cityEntity = city;
      _cityController.text = city.cityName;
      return;
    }
    // });
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
