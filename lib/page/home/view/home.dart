import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:z_translate/core/style_color.dart';
import 'package:z_translate/page/home/controller/home_controller.dart';
import 'package:z_translate/page/home/view/widget/common_button.dart';
import 'package:z_translate/page/home/view/widget/heading_outputcontainer.dart';
import 'package:z_translate/page/home/view/widget/output_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeC = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppStyle().kblack,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
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
              const SizedBox(
                height: 15,
              ),
              Divider(
                color: AppStyle().kDividerColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<HomeController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            log("Language List Length: ${homeC.languageList.length}");

                            Get.bottomSheet(Container(
                              color: const Color.fromARGB(255, 33, 32, 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [TextFormField(),
                                Text('All Languages'),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: homeC.languageList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            decoration: BoxDecoration(
                                                color: AppStyle().kgray,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: Get.height * 0.08,
                                            child: Center(
                                              child: Text(
                                                homeC
                                                    .languageList[index].language,
                                                style: TextStyle(
                                                    color: AppStyle().textColor,fontSize: 25),
                                              ),
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ));
                            //
                          },
                          child: Cbutton(tex: homeC.detectlanguge)),
                      Icon(
                        Icons.swap_horiz_sharp,
                        size: 30,
                        color: Color.fromARGB(235, 111, 111, 111),
                      ),
                      Cbutton(tex: homeC.translateto),
                    ],
                  );
                },
              ),
              HeadingOutputContainer(tex: homeC.detectlanguge),
              OutputContainer(control: homeC.detecteditc),
              HeadingOutputContainer(tex: homeC.translateto),
              OutputContainer(control: homeC.translateeditC),
            ],
          ),
        ),
      )),
    );
  }
}
