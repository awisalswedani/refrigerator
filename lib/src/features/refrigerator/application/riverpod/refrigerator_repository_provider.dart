import 'package:flutter_application_1/src/features/refrigerator/domain/refrigerator_item.dart';

abstract class RefrigeratorRepository {
  Future<void> addOrUpdateItem(RefrigeratorItem item);
  Future<void> deleteItem(String itemId);
  Stream<List<RefrigeratorItem>> getItems();
}



