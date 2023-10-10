import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:petro_audit/utils/utils.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController? userNameCont = TextEditingController();
  TextEditingController? passwordCont = TextEditingController();
  bool isLoading = false;
  bool isSuccess = false;
  String? uid;
  String? token;

  void submintUsernamePassword() async {
    const storage = FlutterSecureStorage();
    isLoading = true;
    notifyListeners();
    var url = Uri.parse(Utils.petroApi + Utils.validateApi);
    log(url.toString());

    final bodyMsg = jsonEncode({
      "userName": userNameCont!.text,
      "password": passwordCont!.text,
      "authType": "FORMS",
      "ipAddress": ""
    });

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: bodyMsg);
    // log('Response status: ${response.statusCode}');
    // log('Response body: ${response.body}');
    isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);

      Map<String, dynamic> responseMap =
          decodedResponse as Map<String, dynamic>;

      String uid = responseMap['id'].toString();
      String token = responseMap['token'];

      log(uid.toString());
      log(token);

      await storage.write(key: 'uid', value: uid);
      await storage.write(key: 'userToken', value: token.toString());
      isSuccess = true;
      notifyListeners();
    } else {
      isSuccess = false;
      notifyListeners();
    }
  }
}
