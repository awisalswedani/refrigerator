import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onTap; // Make onTap optional

  const Products({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap, // Optional onTap function
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use onTap if provided
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: isSelected
                  ? const Color.fromRGBO(88, 94, 111, 1)
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
