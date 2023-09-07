import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_translate/core/style_color.dart';

class Cbutton extends StatelessWidget {
  const Cbutton({
    super.key,
    required this.tex,
  });
  final String tex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppStyle().kbutton,borderRadius: BorderRadius.circular(20)),
      height: Get.size.height * 0.067,
      width: Get.size.width * 0.38,
      child: Center(child: Text(tex,style: TextStyle(color: AppStyle().textColor,fontSize: 16),)),
    );
  }
}
