import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/check_item_controller.dart';

class ItemView extends GetView<CheckItemController> {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.green.shade300,
        child: Container(
          height: (Get.height) * .9,
          width: Get.width * .6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.indigo,
                blurRadius: 50,
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage('resources/images/bascet.jpeg'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      controller.myItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      '${(double.parse(controller.myItem.price)).toStringAsFixed(2)} JD',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      controller.myItem.barcode,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemNotExist extends StatelessWidget {
  const ItemNotExist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red.shade400,
        alignment: Alignment.center,
        child: const Text(
          'Item Not Exist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 70,
          ),
        ),
      ),
    );
  }
}
