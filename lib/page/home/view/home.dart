import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z_translate/core/style_color.dart';
import 'package:z_translate/page/home/view/widget/common_button.dart';
import 'package:z_translate/page/home/view/widget/heading_outputcontainer.dart';
import 'package:z_translate/page/home/view/widget/output_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle().kblack,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Text Translation',
                  style: TextStyle(color: AppStyle().textColor, fontSize: 23),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: AppStyle().kDividerColor,
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Cbutton(tex: 'eng'),
                Icon(
                  Icons.swap_horiz_sharp,
                  size: 30,
                  color: Color.fromARGB(235, 111, 111, 111),
                ),
                Cbutton(tex: 'mal'),
              ],
            ),
            HeadingOutputContainer(),
            OutputContainer(),
            HeadingOutputContainer(),
            OutputContainer(),
          ],
        ),
      )),
    );
  }
}


