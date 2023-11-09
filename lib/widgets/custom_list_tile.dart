import 'package:flutter/material.dart';
import 'package:tesstprovicer/models/country_entity.dart';
import 'package:tesstprovicer/models/city_entity.dart';
import 'package:tesstprovicer/models/company_entity.dart';

class CustomListTile<T> extends StatefulWidget {
  final T entity;
  final Widget? prefixWidget;
  final bool isActive;
  const CustomListTile({
    super.key,
    required this.entity,
    this.prefixWidget,
    this.isActive = false,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState<T>();
}

class _CustomListTileState<T> extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8.0).copyWith(bottom: 16, left: 0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.8,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (getImageUrl(widget.entity) != null)
            Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(getImageUrl(widget.entity)!),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                getTitle(widget.entity),
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          widget.prefixWidget ??
              Container(
                padding: EdgeInsets.all(widget.isActive ? 2 : 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: widget.isActive ? Colors.amber : Colors.grey,
                  ),
                ),
                width: 20,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.isActive ? Colors.amber : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isActive ? Colors.amber : Colors.grey,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  String? getImageUrl(T data) {
    switch (T) {
      case CountryEntity:
        {
          return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlayhegQudmnTDlrr7g09ejr1fBN6YKKkUCb-n6fBG7P8XbwVPMEJ6SFIxdKYACdHGTUM&usqp=CAU";
          // final countryEntity = data as CountryEntity;
          // return countryEntity.countryFlag;
        }
      default:
        return null;
    }
  }

  String getTitle(T data) {
    switch (T) {
      case CountryEntity:
        {
          final countryEntity = data as CountryEntity;
          return countryEntity.countryName;
        }
      case CompanyEntity:
        {
          final companyEntity = data as CompanyEntity;
          return companyEntity.companyName;
        }
      case CityEntity:
        {
          final cityEntity = data as CityEntity;
          return cityEntity.cityName;
        }
      default:
        return "";
    }
  }
}
