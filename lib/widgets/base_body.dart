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
  final ValueNotifier<int?> _currentIndex = ValueNotifier(null);
  final ValueNotifier<List<T>> _listEntites = ValueNotifier([]);
  late List<T> originData;

  @override
  void initState() {
    originData = Data.getData(T);
    _listEntites.value = originData;
    _currentIndex.value =
        originData.indexWhere((element) => checkIsActive(element));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: ValueListenableBuilder<int?>(
          valueListenable: _currentIndex,
          builder: (context, currentIndex, _) {
            return SingleChildScrollView(
              child: ValueListenableBuilder<List<T>>(
                  valueListenable: _listEntites,
                  builder: (context, data, _) {
                    return Column(
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
                        (widget.hasFilter ?? false)
                            ? _searchInput()
                            : Container(),
                        ..._buildListItem(data, currentIndex)
                      ],
                    );
                  }),
            );
          }),
    );
  }

  List<Widget> _buildListItem(List<T> data, int? currentIndex) {
    List<Widget> res = [];
    for (int i = 0; i < data.length; i++) {
      res.add(
        GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(data[i]);
            }
            _currentIndex.value = i;
            Navigator.of(context).pop();
          },
          child: CustomListTile<T>(
            isActive: ((currentIndex ?? -1) == i),
            entity: data[i],
          ),
        ),
      );
    }
    return res;
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
                  _isIconClearVisible.value = true;
                } else {
                  _isIconClearVisible.value = false;
                }
                _onChangeSearch(text);
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
                          _listEntites.value = originData;
                          _isIconClearVisible.value = false;
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 14),
                          child: Icon(Icons.clear),
                        ),
                      )
                    : null,
                prefixIcon: const Icon(Icons.search, color: Colors.black87),
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
  }

  void _onChangeSearch(String name) {
    name = name.toLowerCase().trim();
    List<T> foundEntity = [];
    if (name == "") {
      _listEntites.value = originData;
      return;
    } else {
      for (T entity in originData) {
        if (entity is CountryEntity) {
          final countryEntity = entity;
          if (countryEntity.countryName
              .toLowerCase()
              .trim()
              .contains(name, 0)) {
            foundEntity.add(entity);
          }
        }
        if (entity is CompanyEntity) {
          final companyEntity = entity;
          if (companyEntity.companyName
              .toLowerCase()
              .trim()
              .contains(name, 0)) {
            foundEntity.add(entity);
          }
        }
        if (entity is CityEntity) {
          final cityEntity = entity;
          if (cityEntity.cityName.toLowerCase().trim().contains(name, 0)) {
            foundEntity.add(entity);
          }
        }
      }
    }
    if (foundEntity.isNotEmpty) {
      _listEntites.value = foundEntity;
    } else {
      _listEntites.value = [];
    }
  }
}
