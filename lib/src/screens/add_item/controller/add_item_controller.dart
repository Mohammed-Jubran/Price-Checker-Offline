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
        double priceNumberFormat = double.tryParse(itemPrice.text) ?? 0.0;
        itemPrice.text = priceNumberFormat.toStringAsFixed(2);
        boxItem.put(
          itemBarcode.text,
          Item(
            name: itemName.text,
            barcode: itemBarcode.text,
            price: itemPrice.text,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('product added successfully')),
        );
        itemName.clear();
        itemBarcode.clear();
        itemPrice.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            closeIconColor: Colors.black,
            content: Text(
              'The product is exist',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    }
  }

  bool isValid({required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
