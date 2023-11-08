import 'package:flutter/material.dart';

Future<void> showBottomSheetBase(
  BuildContext context, {
  Widget? body,
  double totalMaxHeight = 0.7,
  bool isDismissible = true,
  bool isShowIndicator = true,
  bool isAutoScroll = false,
  double? height,
}) async {
  final ValueNotifier<double> columnHeight = ValueNotifier(height ?? 0);
  final GlobalKey columnKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  // Calculate height after render body
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final screenHeight = MediaQuery.of(context).size.height;
    final RenderBox box =
        columnKey.currentContext?.findRenderObject() as RenderBox;
    if (columnHeight.value == 0) {
      if (box.size.height >= screenHeight * totalMaxHeight) {
        columnHeight.value = screenHeight * totalMaxHeight;
      } else {
        columnHeight.value = box.size.height;
      }
    }
    if (isAutoScroll == true) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  });

  await showModalBottomSheet<dynamic>(
    isDismissible: isDismissible,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24),
        topLeft: Radius.circular(24),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return ValueListenableBuilder<double>(
          valueListenable: columnHeight,
          builder: (context, height, _) {
            return Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              height: height,
              child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    key: columnKey,
                    children: [
                      Column(
                        children: [
                          if (isShowIndicator)
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 24,
                                ),
                                height: 4,
                                width: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDFE4EA),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          body ??
                              const Center(
                                child: Text("Nothing here"),
                              ),
                        ],
                      ),
                    ],
                  )),
            );
          });
    },
  );
}
