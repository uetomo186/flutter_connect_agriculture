import 'package:flutter/material.dart';
import 'package:flutter_connect_agriculture/config/constants/colors.dart';
import 'package:flutter_connect_agriculture/config/constants/text_strings.dart';

class TFormDividerWidget extends StatelessWidget {
  const TFormDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Row(
      children: [
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 50,
            color: Colors.black.withOpacity(0.7),
            endIndent: 10,
          ),
        ),
        Text(
          tOR,
          style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: isDark
                    ? tDarkColor.withOpacity(0.8)
                    : tDarkColor.withOpacity(0.8),
              ),
        ),
        Flexible(
          child: Divider(
            thickness: 1,
            indent: 10,
            color: Colors.black.withOpacity(0.7),
            endIndent: 50,
          ),
        ),
      ],
    );
  }
}
