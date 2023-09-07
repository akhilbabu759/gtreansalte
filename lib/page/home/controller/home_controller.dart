import 'package:get/get.dart';
import 'package:z_translate/page/home/model/home_model.dart';
import 'package:z_translate/page/home/service/home_service.dart';

class HomeController extends GetxController{
  String detectlanguge='English';
  String translateto='malayalam';
   String output='';
  List<LanguageElement>languageList=[];
  void getLaguage()async{
    await HomeService().loadLanguages().then((value) => languageList=value);
    update();
  }

  void detectLaguage(String tex)async{
    await HomeService().detectLanguage(tex).then((value) => detectlanguge=value);
    update();
  }
  void translateLaguage(String tex)async{
    await HomeService().translate(tex,detectlanguge,translateto).then((value) => output=value);
    update();
  }

}