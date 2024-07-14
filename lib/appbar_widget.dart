// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  const AppBarWidget({
    super.key,
    this.title = "Logo",
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: SizedBox(
                width: 90,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 30),
                  ),
                )),
          ),
          IconButton(
            onPressed: () {},
            icon: icon,
            style: const ButtonStyle(iconSize: MaterialStatePropertyAll(45)),
          )
        ],
      ),
    );
  }
}
