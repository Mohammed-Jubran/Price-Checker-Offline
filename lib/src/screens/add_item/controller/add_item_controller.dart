import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/box_storage/boxes.dart';
import '../../../common/box_storage/item.dart';

class AddItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddItemController());
  }
}

class AddItemController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController itemName = TextEditingController();
  TextEditingController itemBarcode = TextEditingController();
  TextEditingController itemPrice = TextEditingController();

  Future<void> addItem({required BuildContext context}) async {
    if (isValid(context: context)) {
      Item? item = boxItem.get(itemBarcode.text);
      if (item == null) {
        boxItem.put(
          itemBarcode.text,
          Item(
            name: itemName.text,
            barcode: itemBarcode.text,
            price: itemPrice.text,
          ),
        );

        itemName.clear();
        itemBarcode.clear();
        itemPrice.clear();
      } else {
        Get.defaultDialog(
          title: 'Warning',
          content: const Text('The product is exist'),
        );
      }
    }
  }

  bool isValid({required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('product added successfully')),
      );
      return true;
    }
    return false;
  }
}
