import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_translate/core/style_color.dart';

class OutputContainer extends StatelessWidget {
  const OutputContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: AppStyle().kbutton,
      ),height: Get.size.height*0.25,
    );
  }
}
