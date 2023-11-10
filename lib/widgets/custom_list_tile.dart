import 'package:flutter/material.dart';
import 'package:tesstprovicer/widgets/base_body.dart';

class CustomListTile<T extends BaseEntity> extends StatelessWidget {
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
          if (getImageUrl(entity) != null)
            Container(
              margin: const EdgeInsets.only(
                right: 8,
              ),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(getImageUrl(entity)!),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                getTitle(entity),
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          prefixWidget ??
              Container(
                padding: EdgeInsets.all(isActive ? 2 : 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1,
                    color: isActive ? Colors.amber : Colors.grey,
                  ),
                ),
                width: 20,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: isActive ? Colors.amber : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? Colors.amber : Colors.grey,
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  String? getImageUrl(T data) {
    return data.getImageUrl;
  }

  String getTitle(T data) {
    return data.getSearchName;
  }
}
