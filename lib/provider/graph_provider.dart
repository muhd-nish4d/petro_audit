import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petro_audit/models/graph_model.dart';
import 'package:petro_audit/utils/utils.dart';

import '../urls/urls.dart';

class GraphProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccess = false;
  List<GraphModel>? graphDatas;
  void getGraphDatas() async {
    isLoading = true;
    notifyListeners();
    final response = await Utils.apiCall(Urls.petroApi + Urls.barGraphApi);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body) as List<dynamic>;

      List<GraphModel> graphData = decodedResponse.map((dynamic jsonObject) {
        return GraphModel.fromJson(jsonObject as Map<String, dynamic>);
      }).toList();

      log(graphData.toString());

      isLoading = false;
      notifyListeners();

      isSuccess = true;
      notifyListeners();

      graphDatas = graphData;
      notifyListeners();
    } else {
      return null;
    }
  }
}
