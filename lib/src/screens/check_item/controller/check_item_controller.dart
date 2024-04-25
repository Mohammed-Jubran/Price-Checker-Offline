import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/src/common/box_storage/item.dart';

import '../../../common/box_storage/boxes.dart';
import '../../../common/set_full_screen.dart';
import '../view/item_view.dart';

class CheckItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckItemController());
  }
}

class CheckItemController extends GetxController {
  late Item myItem;
  FocusNode focusNode = FocusNode();
  TextEditingController barcode = TextEditingController();

  @override
  void onInit() {
    setFullScreen(fullScreen: true);
    super.onInit();
  }

  Future<void> checkItemBarcode() async {
    if (barcode.text == r'962') {
      await setFullScreen(fullScreen: false);
      Get.back();
      return;
    }
    Item? item = boxItem.get(barcode.text);
    if (item != null) {
      myItem = item;
      Get.to(() => const ItemView());
      barcode.clear();
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.back();
        },
      );
      focusNode.requestFocus();
    } else {
      Get.to(() => const ItemNotExist());
      barcode.clear();
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.back();
        },
      );
      focusNode.requestFocus();
    }
  }
}
