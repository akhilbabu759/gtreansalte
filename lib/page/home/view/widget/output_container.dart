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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppStyle().kbutton,
      ),
      height: Get.size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(''),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppStyle().kDividerColor,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '123/2350',
                    style: TextStyle(color: AppStyle().kgray, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
