import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/home_model.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/utils/utils.dart';

import '../urls/urls.dart';

class HomeProvider extends ChangeNotifier {
  CallStatus? status;
  String? errorMassege;
  HomeDatasModel? homeData;

  void getHomeDatas(BuildContext context) async {
    status = CallStatus.waiting;
    notifyListeners();

    try {
      final response = await Utils.apiCall(Urls.petroApi + Urls.homeApi);

      if (response.statusCode == 200) {
        try {
          var data = jsonDecode(response.body);

          if (data is Map<String, dynamic>) {
            homeData = HomeDatasModel.fromJson(data);
            status = CallStatus.success;
            notifyListeners();
          } else if (data is String) {
            try {
              var jsonData = jsonDecode(data) as Map<String, dynamic>;
              homeData = HomeDatasModel.fromJson(jsonData);
              status = CallStatus.success;
              notifyListeners();
            } catch (e) {
              errorMassege = e.toString();
              status = CallStatus.failed;
              notifyListeners();
              log('Error decoding inner JSON 2: $e');
            }
          } else {
            errorMassege = 'Unknown JSON data type';
            status = CallStatus.failed;
            notifyListeners();
            log('Unknown JSON data type');
          }
        } catch (e) {
          errorMassege = e.toString();
          status = CallStatus.failed;
          notifyListeners();
          log('Error decoding JSON: $e');
        }

        log(homeData.toString());

        status = CallStatus.success;
        notifyListeners();
      } else {
        errorMassege = response.statusCode.toString();
        status = CallStatus.failed;
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      errorMassege = e.toString();
      status = CallStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }
}
