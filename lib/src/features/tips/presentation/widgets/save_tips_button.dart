import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/src/features/tips/application/tips_state.dart'
    as tipsModule;

class SaveTipsButton extends ConsumerWidget {
  final String text;
  final String? selectedCategory;
  final String name;
  final String details;

  const SaveTipsButton({
    super.key,
    required this.text,
    required this.selectedCategory,
    required this.name,
    required this.details,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void saveData() {
      final firestoreService = ref.read(tipsModule.firestoreServiceProvider);

      if (selectedCategory != null && name.isNotEmpty && details.isNotEmpty) {
        firestoreService
            .saveTip(
          selectedCategory!,
          name,
          details,
        )
            .then((_) {
          print('Tip saved successfully');
        }).catchError((error) {
          print('Failed to save tip: $error');
        });
      } else {
        print('Some fields are missing');
      }
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(20, 27, 44, 1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: saveData,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
