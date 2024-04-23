import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../common/box_storage/boxes.dart';
import '../../../common/box_storage/item.dart';

class AllItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllItemController());
  }
}

class AllItemController extends GetxController {
  List<ItemResult> itemList = [];
  final List<ItemResult> _itemList = [];

  @override
  void onInit() {
    convertHiveObjectToList();
    super.onInit();
  }

  void convertHiveObjectToList() {
    for (int i = 0; i < boxItem.length; i++) {
      _itemList.add(
        ItemResult(
          name: boxItem.getAt(i)!.name,
          barcode: boxItem.getAt(i)!.barcode,
          price: boxItem.getAt(i)!.price,
        ),
      );
    }
    itemList = _itemList;
  }

  void filterSearchResults(String? text) {
    if (text != null) {
      text = text.toLowerCase();
      itemList = _itemList
          .where(
            (element) =>
                element.name.toLowerCase().contains(text!) ||
                element.barcode.contains(text),
          )
          .toList();
    } else {
      itemList = _itemList;
    }
    update();
  }
}

class ItemResult {
  final String name;
  final String barcode;
  final String price;

  ItemResult({
    required this.name,
    required this.barcode,
    required this.price,
  });
}
