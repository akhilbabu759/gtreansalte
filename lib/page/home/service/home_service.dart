import 'dart:convert';

import 'package:z_translate/common/api/base_url.dart';
import 'package:z_translate/common/api/end_url.dart';
import 'package:dio/dio.dart';
import 'package:z_translate/page/home/model/home_model.dart';
class HomeService{
 

Future<String> detectLanguage(String text) async {
   String endpoint =BaseUrl().baseurl+EndUrl().detect;
      
  final headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'Accept-Encoding': 'application/gzip',
    'X-RapidAPI-Key': 'fa2cce298emsh26efabd3854a611p180ab9jsn21739d2bb072',
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  };
  const sam = 'hello';
  final body = {'q': text ??= sam};
  final response = await Dio()
      .post(endpoint, data: body, options: Options(headers: headers));
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = response.data;
    final String language =
        jsonResponse['data']['detections'][0][0]['language'];
    return language;
  } else {
    throw Exception('Failed to detect language');
  }
}






Future<List<LanguageElement>> loadLanguages() async {
  String endpoint =BaseUrl().baseurl+EndUrl().getlanguge;
  final headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'Accept-Encoding': 'application/gzip',
    'X-RapidAPI-Key': 'fa2cce298emsh26efabd3854a611p180ab9jsn21739d2bb072',
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  };

  try {
    final response = await Dio().get(endpoint,options: Options(headers:headers ),  );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.data);
      final List<dynamic> languagesJson = jsonResponse['data']['languages'];
      final languages =
          languagesJson.map((lang) => LanguageElement.fromJson(lang)).toList();
      return languages;
    } else {
      throw Exception('Failed to fetch supported languages');
    }
  } catch (e) {
    throw Exception('Failed to fetch supported languages: $e');
  }
}





Future<String> translate(
    String text, String sourceLangCode, String targetLangCode) async {
 String endpoint =BaseUrl().baseurl;
  final headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'Accept-Encoding': 'application/gzip',
    'X-RapidAPI-Key': 'fa2cce298emsh26efabd3854a611p180ab9jsn21739d2bb072',
    'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com',
  };
  final data = {
    'q': text,
    'source': sourceLangCode,
    'target': targetLangCode,
  };
  final dio = Dio(BaseOptions(headers: headers));
  try {
    final response = await dio.post(endpoint, data: data);
    if (response.statusCode == 200) {
      print("poliiiiiiiiiiiiii");
      final Map<String, dynamic> jsonResponse = response.data;
      final String translatedText =
          jsonResponse['data']['translations'][0]['translatedText'];

      print(translatedText);
      return translatedText;
    } else {
      return "Sorry brooooooooooo........";
    }
  } catch (e) {
    throw Exception('Failed to translate text: $e');
  }
}



}