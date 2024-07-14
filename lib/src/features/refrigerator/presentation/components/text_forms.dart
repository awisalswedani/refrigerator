import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/form_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/size_text_field_widget.dart';
import 'package:flutter_application_1/src/features/refrigerator/presentation/widgets/text_fields_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/test.dart'; // Make sure this import is correct

class TextForms extends ConsumerWidget {
  const TextForms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formStateProvider);
    return Column(
      children: [
        TextFieldWidget(
          onChanged1: (value) {
            formState.updatePurchaseDate(value);
          },
          onChanged2: (value) {
            formState.updateExpirationDate(value);
          },
          text1: "Purchase Date",
          text2: "Expiration Date",
        ),
        const SizedBox(height: 15),
        TextFieldWidget(
          onChanged1: (value) {
            formState.updateQuantity(value);
          },
          onChanged2: (value) {
            formState.updateUnit(value);
          },
          text1: "Quantity",
          text2: "Unit",
        ),
        const SizedBox(
          height: 10,
        ),
        FormFieldWidget(
          onChanged: (value) {
            formState.updateMarketName(value);
          },
          text: "Market Name",
        ),
        SizeTextFieldWidget(
          onChanged: (value) {
            formState.updateNotes(value);
          },
          text: "Notes...",
          contentPaddingSize: 40,
        ),
        //ButtonWidget(text: "Proceed", selectedCategory: "DefaultCategory"),
      ],
    );
  }
}
