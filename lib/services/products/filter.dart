import 'dart:convert';

import 'package:flutter/services.dart';

class Filter {
  static Future<Map<String, dynamic>> loadAllData() async {
    String jsonData = await loadJsonFromAssets();
    Map<String, dynamic> data = jsonDecode(jsonData);

    Map<String, dynamic> allData = {};
    List<String> categories = data['smartphones'].keys.toList();
    for (String category in categories) {
      List<String> storageOptions = await getStorageOptions(category);
      Map<String, List<String>> availableModels = {};
      for (String storageOption in storageOptions) {
        List<String> models = await getAvailableModels(category, storageOption);
        availableModels[storageOption] = models;
      }
      allData[category] = {'models': availableModels};
    }
    return allData;
  }

  static Future<String> loadJsonFromAssets() async {
    String jsonString =
        await rootBundle.loadString('lib/assets/data/smartphones.json');
    return jsonString;
  }

  static Future<List<String>> getCategories() async {
    String jsonData = await loadJsonFromAssets();
    Map<String, dynamic> data = jsonDecode(jsonData);
    return data['smartphones'].keys.toList();
  }

  static Future<List<String>> getStorageOptions(String category) async {
    String jsonData = await loadJsonFromAssets();
    Map<String, dynamic> data = jsonDecode(jsonData);
    List<Map<String, dynamic>> selectedCategoryItems =
        List<Map<String, dynamic>>.from(data['smartphones'][category]);

    Set<String> storageOptions = {};
    for (var item in selectedCategoryItems) {
      storageOptions.add(item['device details']['Storage']);
    }
    List<String> sortedStorageOptions = storageOptions.toList();
    sortedStorageOptions.sort();
    return sortedStorageOptions;
  }

  static Future<List<String>> getAvailableModels(
      String category, String selectedStorageOption) async {
    String jsonData = await loadJsonFromAssets();
    Map<String, dynamic> data = jsonDecode(jsonData);
    List<Map<String, dynamic>> selectedCategoryItems =
        List<Map<String, dynamic>>.from(data['smartphones'][category]);

    List<String> availableModels = [];
    for (var item in selectedCategoryItems) {
      if (item['device details']['Storage'] == selectedStorageOption) {
        availableModels.add(item['device details']['Model']);
      }
    }
    return availableModels;
  }
}
