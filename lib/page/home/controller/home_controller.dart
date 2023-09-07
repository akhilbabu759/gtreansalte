import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:z_translate/page/home/model/home_model.dart';
import 'package:z_translate/page/home/service/home_service.dart';

class HomeController extends GetxController{
  @override
  void onInit() {
    getLaguage();
    // TODO: implement onInit
    super.onInit();
  }
  TextEditingController searchControleer=TextEditingController();
  TextEditingController detecteditc=TextEditingController();
  TextEditingController translateeditC=TextEditingController();
  String detectlanguge='en';
  String translateto='ml';
   String output='';
  List<LanguageElement>languageListApi=[];
  List<LanguageElement>languageList=[];
  void detectselectlanguage(String tex){
    detectlanguge=tex;
    update();

  }
  void traslateselectlanguage(String tex){
    translateto=tex;
    update();

  }
  void searchfun(String value){
    languageList=(value==''?languageListApi: languageList
          .where((item) => item.language.toLowerCase().contains(value.toLowerCase()))
          .toList());
          update();
    

  }
  void getLaguage()async{
    log('get langu');
    await HomeService().loadLanguages().then((value) => languageListApi=value);
    update();
    searchfun('');
  }

  void detectLaguage(String tex)async{
    log('called');
    await HomeService().detectLanguage(tex).then((value) => detectlanguge=value);
    update();
  }
  void translateLaguage(String tex)async{
    await HomeService().translate(tex,detectlanguge,translateto).then((value) => output=value);
    translateeditC.text=output;
    update();
  }

}