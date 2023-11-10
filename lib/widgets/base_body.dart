import 'package:flutter/material.dart';
import 'package:tesstprovicer/data/data.dart';
import 'package:tesstprovicer/ultis/extenstions.dart';
import 'package:tesstprovicer/widgets/custom_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseEntity {
  String get getSearchName;
  String get getSearchId;
  String? get getImageUrl;

  List<BaseEntity> getData();
}

class BaseBody<B extends BaseEntity> extends ConsumerStatefulWidget {
  final B? currentEntity;
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
  ConsumerState<BaseBody> createState() => _BaseBodyState<B>();
}

class _BaseBodyState<Entity extends BaseEntity>
    extends ConsumerState<BaseBody> {
  late List<BaseEntity> originData;

  final _isIconClearVisible = StateProvider<bool>((_) => false);
  final _currentIndex = StateProvider<int?>((_) => null);
  final _listEntites = StateProvider<List<BaseEntity>>((_) => []);

  final TextEditingController _searchFieldController = TextEditingController();

  @override
  void initState() {
    originData = Data.getData<Entity>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_listEntites.notifier).state = originData;
      ref.read(_currentIndex.notifier).state =
          originData.indexWhere((element) => checkIsActive(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: SingleChildScrollView(
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
            ..._buildListItem(ref.watch(_listEntites), ref.watch(_currentIndex))
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListItem(List<BaseEntity> data, int? currentIndex) {
    List<Widget> res = [];
    for (int i = 0; i < data.length; i++) {
      res.add(
        GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!(data[i]);
            }
            ref.read(_currentIndex.notifier).state = i;
            Navigator.of(context).pop();
          },
          child: CustomListTile<BaseEntity>(
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
      child: TextField(
        maxLength: 100,
        controller: _searchFieldController,
        autofocus: false,
        onChanged: (text) {
          if (text.isNotEmpty) {
            ref.read(_isIconClearVisible.notifier).state = true;
          } else {
            ref.read(_isIconClearVisible.notifier).state = false;
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
          suffixIcon: ref.watch(_isIconClearVisible)
              ? InkWell(
                  onTap: () {
                    _searchFieldController.clear();
                    ref.read(_listEntites.notifier).state = originData;
                    ref.read(_isIconClearVisible.notifier).state = false;
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
      ),
    );
  }

  bool checkIsActive(BaseEntity entity) {
    if (widget.currentEntity == null) return false;
    return entity.getSearchId == widget.currentEntity!.getSearchId;
  }

  void _onChangeSearch(String name) {
    name = name.toLowerCase().trim();
    List<BaseEntity> foundEntity = [];
    if (name == "") {
      ref.read(_listEntites.notifier).state = originData;
      return;
    } else {
      for (BaseEntity entity in originData) {
        if ((entity.getSearchName).toLowerCase().trim().contains(name, 0)) {
          foundEntity.add(entity);
        }
      }
    }
    if (foundEntity.isNotEmpty) {
      ref.read(_listEntites.notifier).state = foundEntity;
    } else {
      ref.read(_listEntites.notifier).state = [];
    }
  }
}
