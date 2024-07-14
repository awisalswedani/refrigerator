import 'package:flutter_application_1/src/features/refrigerator/application/form_validation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';

class ButtonWidget extends ConsumerWidget {
  final String text;
  final String selectedCategory;

  const ButtonWidget({Key? key, required this.text, required this.selectedCategory});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.read(formStateProvider);
    final _db = FirebaseFirestore.instance;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
          backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(20, 27, 44, 1)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          String? validationError = validateForm(formState, selectedCategory);
          if (validationError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(validationError)),
            );
            return;
          }

          _db.collection("Add_New_Item").add({
            "name": formState.name,
            "purchaseDate": formState.purchaseDate,
            "expirationDate": formState.expirationDate,
            "quantity": formState.quantity,
            "unit": formState.unit,
            "marketName": formState.marketName,
            "notes": formState.notes,
            "imageUrl": formState.imageUrl,
            "category": selectedCategory,
          });
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
