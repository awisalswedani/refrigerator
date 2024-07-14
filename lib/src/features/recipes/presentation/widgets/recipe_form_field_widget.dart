import 'package:flutter/material.dart';

class RecipeFormFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const RecipeFormFieldWidget({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        filled: true,
        fillColor: Colors.white, // Set background color to white
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
