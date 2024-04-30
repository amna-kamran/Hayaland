import 'dart:convert';

import 'package:flutter/services.dart';

class AppleProvider {
  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<Map<String, dynamic>> getApple() async {
    Map<String, dynamic> jsonData =
        await loadJsonFromAssets('lib/assets/data/smartphones.json');
    return jsonData;
  }
}
