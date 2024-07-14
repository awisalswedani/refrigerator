import 'package:flutter/material.dart';

class RecipeSizeTextFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller; // Add TextEditingController parameter
  final double contentPaddingSize;

  const RecipeSizeTextFieldWidget({
    Key? key,
    required this.text,
    required this.controller, // Add required keyword
    this.contentPaddingSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: contentPaddingSize),
          child: TextFormField(
            controller: controller, // Assign controller to TextFormField
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
