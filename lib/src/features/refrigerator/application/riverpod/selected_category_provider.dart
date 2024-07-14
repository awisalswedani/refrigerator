import 'package:flutter_application_1/src/features/refrigerator/application/riverpod/refrigerator_item_riverpod.dart';
import 'package:flutter_application_1/src/features/refrigerator/domain/refrigerator_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider to hold the selected category
final selectedCategoryProvider = StateProvider<String>((ref) => 'Groceries');

// Provider to filter products based on the selected category
final filteredRefrigeratorItemsProvider = Provider<List<RefrigeratorItemModel>>((ref) {
  final items = ref.watch(refrigeratorItemsProvider); // Assuming you have a provider for all items
  final selectedCategory = ref.watch(selectedCategoryProvider);
  return items.where((item) => item.category == selectedCategory).toList();
});
