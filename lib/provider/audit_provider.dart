import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/audit_model.dart';
import 'package:petro_audit/models/status_enum.dart';

import '../urls/urls.dart';
import '../utils/utils.dart';

class AuditProvider extends ChangeNotifier {
  CallStatus? status;
  List<AuditModel>? auditData;

  void getAuditDetails(BuildContext context) async {
    status = CallStatus.waiting;
    notifyListeners();

    try {
      final response = await Utils.apiCall(Urls.petroApi + Urls.auditListApi);
      if (response.statusCode == 200) {
        // var decodedResponse = jsonDecode(response.body) as List<dynamic>;

        List<AuditModel> auditDatas = auditModelFromJson(response.body);

        log(auditDatas.toString());
        auditData = auditDatas;
        notifyListeners();

        status = CallStatus.success;
        notifyListeners();
      } else {
        status = CallStatus.failed;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.statusCode.toString())));
      }
    } catch (e) {
      status = CallStatus.failed;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));

      log(e.toString());
    }
  }
}
