import 'package:flutter/material.dart';

class TipsSizeWidget extends StatelessWidget {
  final double contentPaddingSize;
  final String text;
  final void Function(String)? onChanged;
  const TipsSizeWidget(
      {super.key,
      required this.text,
      required this.contentPaddingSize,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          onChanged: onChanged,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelText: text,
              contentPadding: EdgeInsets.symmetric(
                  vertical: contentPaddingSize, horizontal: 20)),
        ),
      ),
    );
  }
}
