import 'package:freezed_annotation/freezed_annotation.dart';

part 'refrigerator_item.freezed.dart';
part 'refrigerator_item.g.dart';

enum Category {
  Groceries,
  Dairy,
  Meat,
}

@freezed
class RefrigeratorItem with _$RefrigeratorItem {
  const factory RefrigeratorItem({
    required String id,
    required List<String> category,
    required String imageUrl,
    required String name,
    required DateTime purchaseDate,
    required DateTime expirationDate,
    required int quantity,
    required int unit,
    required String marketName,
    required String notes,
  }) = _RefrigeratorItem;

  factory RefrigeratorItem.fromJson(Map<String, dynamic> json) => _$RefrigeratorItemFromJson(json);
}
