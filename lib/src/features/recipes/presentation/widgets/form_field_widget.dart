import 'package:flutter/material.dart';

class RecipeFormFieldWidget extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function(String)? onChanged;

  const RecipeFormFieldWidget({
    super.key,
    required this.text,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: Icon(
              icon,
              size: 35,
            ),
            labelText: text,
            labelStyle: const TextStyle(fontSize: 22),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
