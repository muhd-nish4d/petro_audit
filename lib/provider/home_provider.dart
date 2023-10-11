import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:petro_audit/utils/utils.dart';

import '../urls/urls.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;

  void getHomeDatas() async {
    Utils.apiCall(Urls.petroApi + Urls.homeApi);
  }
}
