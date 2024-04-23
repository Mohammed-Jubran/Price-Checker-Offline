import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:price_checker/src/screens/all_item/controller/all_item_controller.dart';

import '../../../common/image_reference.dart';
import '../../add_item/controller/add_item_controller.dart';
import '../../add_item/view/add_item_screen.dart';
import '../../all_item/view/all_item_screen.dart';
import '../../check_item/controller/check_item_controller.dart';
import '../../check_item/view/check_item_screen.dart';
import '../widget/price_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageReference.homeBackgroundImage6),
            fit: BoxFit.contain,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: PriceButton(
                  title: 'All items',
                  icon: Icons.production_quantity_limits_outlined,
                  onTap: () {
                    Get.to(
                      () => const AllItemScreen(),
                      binding: AllItemBinding(),
                    );
                  },
                ),
              ),
              Expanded(
                child: PriceButton(
                  title: 'Price Checker',
                  icon: Icons.barcode_reader,
                  onTap: () {
                    Get.to(() => const CheckItemScreen(),
                        binding: CheckItemBinding());
                  },
                ),
              ),
              Expanded(
                child: PriceButton(
                  title: 'Add Items',
                  icon: Icons.add,
                  onTap: () {
                    Get.to(
                      () => const AddItemScreen(),
                      binding: AddItemBinding(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
