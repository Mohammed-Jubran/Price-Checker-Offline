import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item {
  Item({required this.name, required this.barcode, required this.price});

  @HiveField(0)
  String name;

  @HiveField(1)
  String barcode;

  @HiveField(2)
  String price;
}
