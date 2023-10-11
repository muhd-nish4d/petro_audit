import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Future<http.Response> apiCall(String api) async {
    const storage = FlutterSecureStorage();
    String? uid = await storage.read(key: 'uid');
    String? token = await storage.read(key: 'userToken');
    // isLoading = true;
    // notifyListeners();
    var url = Uri.parse(api);
    log(url.toString());

    // final Map<String, String> headerMsg = jsonEncode({});

    var response = await http.get(url, headers: {
      "Authorization": "Bearer" + token!,
      "CompanyCode": '1',
      "UserId": uid!,
      "appType": "MOB",
      "content-type": "application/json",
      "accept": "application/json",
    });

    // log(response.statusCode.toString());
    // log(response.body);
    return response;
  }
}
