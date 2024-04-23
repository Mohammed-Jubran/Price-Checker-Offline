import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/check_item_controller.dart';

class CheckItemScreen extends GetView<CheckItemController> {
  const CheckItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          Get.back();
        },
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controller.focusNode.requestFocus();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black87,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Check Price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 70,
                    ),
                  ),
                  Text(
                    'أفحص السعر',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextField(
            cursorColor: Colors.transparent,
            style: const TextStyle(color: Colors.transparent),
            focusNode: controller.focusNode,
            autofocus: true,
            controller: controller.barcode,
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                border: InputBorder.none),
            onSubmitted: (value) {
              controller.checkItemBarcode();
            },
          ),
        ],
      ),
    );
  }
}
