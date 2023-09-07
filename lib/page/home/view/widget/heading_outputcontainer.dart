import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_translate/core/style_color.dart';
import 'package:z_translate/page/home/controller/home_controller.dart';

class HeadingOutputContainer extends StatelessWidget {
  const HeadingOutputContainer({
    super.key,required this.tex,
  });
  final String tex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GetBuilder<HomeController>(builder: (controller) {
        return Row(
          children: [
            Text(
              'Translate From',
              style: TextStyle(color: AppStyle().kgray),
            ),
            Text(
              '($tex)',
              style: TextStyle(color: AppStyle().textColor),
            )
          ], 
        );
      },
      ),
    );
  }
}
