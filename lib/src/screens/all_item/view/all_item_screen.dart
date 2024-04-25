import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:price_checker/src/screens/all_item/controller/all_item_controller.dart';

class AllItemScreen extends GetView<AllItemController> {
  const AllItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const myStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Item'),
        actions: [
          if (kDebugMode) ...[
            IconButton(
              icon: const Icon(
                Icons.delete,
              ),
              onPressed: () async {
                await controller.dropHiveDb();
              },
            ),
          ],
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                controller.filterSearchResults(value);
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GetBuilder<AllItemController>(
                builder: (_) {
                  return ListView.builder(
                    itemCount: controller.itemList.length,
                    itemBuilder: (context, index) {
                      final item = controller.itemList[index];
                      return Card(
                        child: ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: myStyle,
                          ),
                          title: Text(
                            item.name,
                            style: myStyle,
                          ),
                          subtitle: Text(
                            item.barcode,
                            style: myStyle,
                          ),
                          trailing: Text(
                            item.price,
                            style: myStyle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
