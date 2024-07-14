import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(subTitle,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey))
      ],
    );
  }
}
