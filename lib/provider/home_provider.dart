import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/home_model.dart';
import 'package:petro_audit/utils/utils.dart';

import '../urls/urls.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  HomeDatasModel? homeData;

  void getHomeDatas() async {
    isLoading = true;
    notifyListeners();
    final response = await Utils.apiCall(Urls.petroApi + Urls.homeApi);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          homeData = HomeDatasModel.fromJson(data);

          log('heyyyy1');
        } else if (data is String) {
          try {
            var jsonData = jsonDecode(data) as Map<String, dynamic>;
            homeData = HomeDatasModel.fromJson(jsonData);
            log('heyyyy');
          } catch (e) {
            log('Error decoding inner JSON 2: $e');
          }
        } else {
          log('Unknown JSON data type');
        }
      } catch (e) {
        log('Error decoding JSON: $e');
      }

      log(homeData.toString());

      isLoading = false;
      notifyListeners();

      isSuccess = true;
      notifyListeners();
    } else {
      return null;
    }
  }
}
