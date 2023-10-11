// To parse this JSON data, do
//
//     final AuditModel = AuditModelFromJson(jsonString);

import 'dart:convert';

List<AuditModel> auditModelFromJson(String str) =>
    List<AuditModel>.from(json.decode(str).map((x) => AuditModel.fromJson(x)));

// String auditModelToJson(List<AuditModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuditModel {
  int auditId;
  int headerId;
  int? scheduleId;
  int? templateId;
  int? conductedByEmp;
  dynamic hseComplaintRating;
  int uiid;
  dynamic auditTeam;
  String auditNo;
  String? auditType;
  String? auditTypeDesc;
  String? auditTitle;
  String? templateName;
  dynamic btnDeleteData;
  String? condutedByDept;
  String? condutedByDeptName;
  String conductedByEmpName;
  String? auditDesc;
  String? auditLocation;
  dynamic locationId;
  String? auditLocationDesc;
  String? reference;
  String? auditStatus;
  dynamic actionId;
  dynamic closureComments;
  dynamic closureCode;
  dynamic closureCodeDesc;
  dynamic closedBy;
  bool isBtnStart;
  bool isBtnSave;
  bool isBtnFinalSave;
  bool isBtnFinish;
  bool isAuTab;
  DateTime? startDate;
  DateTime? endDate;
  dynamic closureDate;
  List<dynamic> attrValues;
  dynamic actionNo;
  dynamic priority;
  dynamic status;
  dynamic actionOwner;
  dynamic actionStatus;
  dynamic targetDate;
  dynamic year;
  int userId;
  int keyId;
  int companyCode;
  dynamic opsMode;
  dynamic appType;
  dynamic date1;
  dynamic date2;

  AuditModel({
    required this.auditId,
    required this.headerId,
    required this.scheduleId,
    required this.templateId,
    required this.conductedByEmp,
    required this.hseComplaintRating,
    required this.uiid,
    required this.auditTeam,
    required this.auditNo,
    required this.auditType,
    required this.auditTypeDesc,
    required this.auditTitle,
    required this.templateName,
    required this.btnDeleteData,
    required this.condutedByDept,
    required this.condutedByDeptName,
    required this.conductedByEmpName,
    required this.auditDesc,
    required this.auditLocation,
    required this.locationId,
    required this.auditLocationDesc,
    required this.reference,
    required this.auditStatus,
    required this.actionId,
    required this.closureComments,
    required this.closureCode,
    required this.closureCodeDesc,
    required this.closedBy,
    required this.isBtnStart,
    required this.isBtnSave,
    required this.isBtnFinalSave,
    required this.isBtnFinish,
    required this.isAuTab,
    required this.startDate,
    required this.endDate,
    required this.closureDate,
    required this.attrValues,
    required this.actionNo,
    required this.priority,
    required this.status,
    required this.actionOwner,
    required this.actionStatus,
    required this.targetDate,
    required this.year,
    required this.userId,
    required this.keyId,
    required this.companyCode,
    required this.opsMode,
    required this.appType,
    required this.date1,
    required this.date2,
  });

  factory AuditModel.fromJson(Map<String, dynamic> json) => AuditModel(
        auditId: json["auditId"],
        headerId: json["headerId"],
        scheduleId: json["scheduleId"],
        templateId: json["templateId"],
        conductedByEmp: json["conductedByEmp"],
        hseComplaintRating: json["hseComplaintRating"],
        uiid: json["uiid"],
        auditTeam: json["auditTeam"],
        auditNo: json["auditNo"],
        auditType: json["auditType"],
        auditTypeDesc: json["auditTypeDesc"],
        auditTitle: json["auditTitle"],
        templateName: json["templateName"],
        btnDeleteData: json["btnDeleteData"],
        condutedByDept: json["condutedByDept"],
        condutedByDeptName: json["condutedByDeptName"],
        conductedByEmpName: json["conductedByEmpName"],
        auditDesc: json["auditDesc"],
        auditLocation: json["auditLocation"],
        locationId: json["locationId"],
        auditLocationDesc: json["auditLocationDesc"],
        reference: json["reference"],
        auditStatus: json["auditStatus"],
        actionId: json["actionId"],
        closureComments: json["closureComments"],
        closureCode: json["closureCode"],
        closureCodeDesc: json["closureCodeDesc"],
        closedBy: json["closedBy"],
        isBtnStart: json["isBtnStart"],
        isBtnSave: json["isBtnSave"],
        isBtnFinalSave: json["isBtnFinalSave"],
        isBtnFinish: json["isBtnFinish"],
        isAuTab: json["isAuTab"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        closureDate: json["closureDate"],
        attrValues: List<dynamic>.from(json["attrValues"].map((x) => x)),
        actionNo: json["actionNo"],
        priority: json["priority"],
        status: json["status"],
        actionOwner: json["actionOwner"],
        actionStatus: json["actionStatus"],
        targetDate: json["targetDate"],
        year: json["year"],
        userId: json["userId"],
        keyId: json["keyId"],
        companyCode: json["companyCode"],
        opsMode: json["opsMode"],
        appType: json["appType"],
        date1: json["date1"],
        date2: json["date2"],
      );

  // Map<String, dynamic> toJson() => {
  //     "auditId": auditId,
  //     "headerId": headerId,
  //     "scheduleId": scheduleId,
  //     "templateId": templateId,
  //     "conductedByEmp": conductedByEmp,
  //     "hseComplaintRating": hseComplaintRating,
  //     "uiid": uiid,
  //     "auditTeam": auditTeam,
  //     "auditNo": auditNo,
  //     "auditType": auditType,
  //     "auditTypeDesc": auditTypeDescValues.reverse[auditTypeDesc],
  //     "auditTitle": auditTitle,
  //     "templateName": templateNameValues.reverse[templateName],
  //     "btnDeleteData": btnDeleteData,
  //     "condutedByDept": condutedByDept,
  //     "condutedByDeptName": condutedByDeptNameValues.reverse[condutedByDeptName],
  //     "conductedByEmpName": conductedByEmpName,
  //     "auditDesc": auditDesc,
  //     "auditLocation": auditLocation,
  //     "locationId": locationId,
  //     "auditLocationDesc": auditLocationDesc,
  //     "reference": reference,
  //     "auditStatus": auditStatusValues.reverse[auditStatus],
  //     "actionId": actionId,
  //     "closureComments": closureComments,
  //     "closureCode": closureCode,
  //     "closureCodeDesc": closureCodeDesc,
  //     "closedBy": closedBy,
  //     "isBtnStart": isBtnStart,
  //     "isBtnSave": isBtnSave,
  //     "isBtnFinalSave": isBtnFinalSave,
  //     "isBtnFinish": isBtnFinish,
  //     "isAuTab": isAuTab,
  //     "startDate": startDate?.toIso8601String(),
  //     "endDate": endDate?.toIso8601String(),
  //     "closureDate": closureDate,
  //     "attrValues": List<dynamic>.from(attrValues.map((x) => x)),
  //     "actionNo": actionNo,
  //     "priority": priority,
  //     "status": status,
  //     "actionOwner": actionOwner,
  //     "actionStatus": actionStatus,
  //     "targetDate": targetDate,
  //     "year": year,
  //     "userId": userId,
  //     "keyId": keyId,
  //     "companyCode": companyCode,
  //     "opsMode": opsMode,
  //     "appType": appType,
  //     "date1": date1,
  //     "date2": date2,
  // };
}
