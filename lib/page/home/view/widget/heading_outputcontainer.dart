import 'package:flutter/material.dart';
import 'package:z_translate/core/style_color.dart';

class HeadingOutputContainer extends StatelessWidget {
  const HeadingOutputContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Text(
            'Translate From',
            style: TextStyle(color: AppStyle().Kgray),
          ),
          Text(
            '(Germani)',
            style: TextStyle(color: AppStyle().textColor),
          )
        ],
      ),
    );
  }
}
