import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/refrigerator/application/riverpod/selected_category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/food_item_widget.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredItems = ref.watch(filteredRefrigeratorItemsProvider);

    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return FoodItem(
            image: item.imageUrl,
            title: item.name,
            days: item.expirationDate,
            weight: item.quantity,
          );
        },
      ),
    );
  }
}
