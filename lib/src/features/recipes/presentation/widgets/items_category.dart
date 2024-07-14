import 'package:flutter/material.dart';

class ItemCategory extends StatefulWidget {
  final String text;
  final void Function(bool isSelected)? onSelect;
  final bool isSelected;

  const ItemCategory({
    super.key,
    required this.text,
    this.onSelect,
    this.isSelected = false,
  });

  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect?.call(true); // Notify parent widget of selection
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: widget.isSelected ? const Color.fromRGBO(87, 94, 113, 1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isSelected ? Colors.transparent : Colors.black,
            width: 1,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
