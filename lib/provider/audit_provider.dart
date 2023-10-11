import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/audit_model.dart';

import '../urls/urls.dart';
import '../utils/utils.dart';

class AuditProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  List<AuditModel>? auditData;

  void getAuditDetails() async {
    isLoading = true;
    notifyListeners();

    final response = await Utils.apiCall(Urls.petroApi + Urls.auditListApi);
    if (response.statusCode == 200) {
      // var decodedResponse = jsonDecode(response.body) as List<dynamic>;

      List<AuditModel> auditDatas = auditModelFromJson(response.body);

      log(auditDatas.toString());

      isLoading = false;
      notifyListeners();

      isSuccess = true;
      notifyListeners();

      auditData = auditDatas;
      notifyListeners();
    } else {
      return null;
    }
  }
}
