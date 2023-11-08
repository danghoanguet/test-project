import 'package:flutter/material.dart';
import 'package:tesstprovicer/data/data.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';
import 'package:tesstprovicer/models/country_entity.dart';
import 'package:tesstprovicer/ultis/extenstions.dart';
import 'package:tesstprovicer/widgets/custom_list_tile.dart';

class BaseBody<T> extends StatefulWidget {
  final T? currentEntity;
  final String? title;
  final bool? hasFilter;
  final Function(dynamic)? onTap;
  const BaseBody({
    Key? key,
    this.title,
    this.hasFilter,
    this.onTap,
    this.currentEntity,
  }) : super(key: key);

  @override
  State<BaseBody> createState() => _BaseBodyState<T>();
}

class _BaseBodyState<T> extends State<BaseBody> {
  final ValueNotifier<bool> _isIconClearVisible = ValueNotifier(false);
  final TextEditingController _searchFieldController = TextEditingController();
  late List<T> data;
  final ValueNotifier<int?> _currentIndex = ValueNotifier(null);

  @override
  void initState() {
    data = Data.getData(T);
    // for (int i = 0; i < data.length; i++) {
    //   _currentIndex.value = getIndex(data[i], i);
    // }
    _currentIndex.value = data.indexWhere((element) => checkIsActive(element));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.title.isNotNullAndNotEmpty)
            Text(
              widget.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          (widget.hasFilter ?? false) ? _searchInput() : Container(),
          ValueListenableBuilder<int?>(
              valueListenable: _currentIndex,
              builder: (context, value, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ..._buildListItem(value),
                  ],
                );
              }),
        ],
      ),
    );
  }

  List<Widget> _buildListItem(int? currentIndex) {
    List<Widget> res = [];
    for (int i = 0; i < data.length; i++) {
      // print(
      //     "build: $currentIndex\t$i\tisActive: ${((currentIndex ?? -1) == i)}");

      res.add(GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(data[i]);
          }
          _currentIndex.value = i;
          // Navigator.of(context).pop();
        },
        child: CustomListTile<T>(
          // isActive: checkIsActive(data[i]),
          isActive: ((currentIndex ?? -1) == i),
          entity: data[i],
        ),
      ));
    }

    return res;
  }

  // int getIndex(T entity, int index) {
  //   if (widget.currentEntity == null) return -1;
  //   int res = -1;
  //   if (entity is CountryEntity) {
  //     final countryEntity = entity;
  //     final currentEntity = widget.currentEntity as CountryEntity;

  //     return countryEntity.countryId == currentEntity.countryId ? index : -1;
  //   }
  //   if (entity is CompanyEntity) {
  //     final companyEntity = entity;
  //     final currentEntity = widget.currentEntity as CompanyEntity;

  //     return companyEntity.companyName == currentEntity.companyName
  //         ? index
  //         : -1;
  //   }
  //   if (entity is CityEntity) {
  //     final cityEntity = entity;
  //     final currentEntity = widget.currentEntity as CityEntity;

  //     return cityEntity.cityId == currentEntity.cityId ? index : -1;
  //   }
  //   return res;
  // }

  bool checkIsActive(T entity) {
    if (widget.currentEntity == null) return false;
    bool res = false;
    if (entity is CountryEntity) {
      final countryEntity = entity;
      final currentEntity = widget.currentEntity as CountryEntity;

      return res = countryEntity.countryId == currentEntity.countryId;
    }
    if (entity is CompanyEntity) {
      final companyEntity = entity;
      final currentEntity = widget.currentEntity as CompanyEntity;

      return res = companyEntity.companyName == currentEntity.companyName;
    }
    if (entity is CityEntity) {
      final cityEntity = entity;
      final currentEntity = widget.currentEntity as CityEntity;

      return res = cityEntity.cityId == currentEntity.cityId;
    }
    return res;
    // not work
    // switch (entity) {
    //   case CountryEntity:
    //     {
    //       final countryEntity = data as CountryEntity;
    //       final currentEntity = widget.currentEntity as CountryEntity;

    //       return res = countryEntity.countryId == currentEntity.countryId;
    //     }
    //   case CompanyEntity:
    //     {
    //       final companyEntity = data as CompanyEntity;
    //       final currentEntity = widget.currentEntity as CompanyEntity;

    //       return res = companyEntity.companyName == currentEntity.companyName;
    //     }
    //   case CityEntity:
    //     {
    //       final cityEntity = data as CityEntity;
    //       final currentEntity = widget.currentEntity as CityEntity;

    //       return res = cityEntity.cityId == currentEntity.cityId;
    //     }
    //   default:
    //     return res;
    // }
  }

  Widget _searchInput() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ValueListenableBuilder<bool>(
          valueListenable: _isIconClearVisible,
          builder: (context, value, _) {
            return TextField(
              maxLength: 100,
              controller: _searchFieldController,
              autofocus: false,
              onChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    _isIconClearVisible.value = true;
                  });
                } else {
                  setState(() {
                    _isIconClearVisible.value = false;
                  });
                }
              },
              onEditingComplete: (() {
                FocusScope.of(context).unfocus();
                return;
              }),
              style: const TextStyle(fontSize: 17, height: 1.3),
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                counterText: "",
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 18, minWidth: 18),
                suffixIcon: _isIconClearVisible.value
                    ? InkWell(
                        onTap: () {
                          _searchFieldController.clear();
                          setState(() {
                            _isIconClearVisible.value = false;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Icon(Icons.clear),
                        ),
                      )
                    : null,
                prefixIcon: const Icon(Icons.search, color: Colors.black87),
                // filled: true,
                // fillColor: const Color(0xFFF4F7FA),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                hintText: "Search for ${(widget.title ?? "").toLowerCase()}...",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black54.withOpacity(0.4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: const BorderSide(
                    width: 0,
                    color: Color(0xFFF4F7FA),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
