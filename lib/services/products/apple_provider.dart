import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:web_task1/model/smartphone.dart';

class AppleProvider {
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<List<dynamic>> getApple() async {
    Map<String, dynamic> jsonData =
        await loadJsonFromAssets('lib/assets/data/smartphones.json');
    final data = jsonData['smartphones']["Apple"];
    List<dynamic> dataList = data.asMap().entries.map((entry) {
      return Smartphone.fromJson(entry.value);
    }).toList();
    return dataList;
  }

  Future<Smartphone?> getAppleByIMEI(String imei) async {
    List<dynamic> phones = await getApple();
    return phones.firstWhere((phone) => phone.imei == imei, orElse: () => null);
  }
}
