class InventoryModel {
  final String item;
  final int available;
  final String unit;
  final int minimumStock;

  InventoryModel({
    required this.item,
    required this.available,
    required this.unit,
    required this.minimumStock,
  });

  bool get isLowStock => available <= minimumStock;
}