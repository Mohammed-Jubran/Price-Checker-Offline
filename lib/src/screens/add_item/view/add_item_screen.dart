import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/add_item_controller.dart';

class AddItemScreen extends GetView<AddItemController> {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Items'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: controller.itemName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              TextFormField(
                controller: controller.itemBarcode,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Barcode'),
                ),
              ),
              TextFormField(
                controller: controller.itemPrice,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {
                  controller.addItem(context: context);
                },
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
