import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/graph_model.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/utils/utils.dart';

import '../urls/urls.dart';

class GraphProvider extends ChangeNotifier {
  // bool isLoading = false;
  // bool isSuccess = false;
  CallStatus? status;
  List<GraphModel>? graphDatas;
  void getGraphDatas(BuildContext context) async {
    status = CallStatus.waiting;
    notifyListeners();
    try {
      final response = await Utils.apiCall(Urls.petroApi + Urls.barGraphApi);

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body) as List<dynamic>;

        List<GraphModel> graphData = decodedResponse.map((dynamic jsonObject) {
          return GraphModel.fromJson(jsonObject as Map<String, dynamic>);
        }).toList();

        graphDatas = graphData;
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
