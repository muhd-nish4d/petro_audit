// To parse this JSON data, do
//
//     final GraphModel = GraphModelFromJson(jsonString);

class GraphModel {
  String item;
  int count;
  String colour;
  String icon;
  String screenUrl;
  String screenCode;
  String screenTitle;

  GraphModel({
    required this.item,
    required this.count,
    required this.colour,
    required this.icon,
    required this.screenUrl,
    required this.screenCode,
    required this.screenTitle,
  });

  factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        item: json["Item"],
        count: json["Count"],
        colour: json["Colour"],
        icon: json["Icon"],
        screenUrl: json["ScreenUrl"],
        screenCode: json["ScreenCode"],
        screenTitle: json["ScreenTitle"],
      );

  Map<String, dynamic> toJson() => {
        "Item": item,
        "Count": count,
        "Colour": colour,
        "Icon": icon,
        "ScreenUrl": screenUrl,
        "ScreenCode": screenCode,
        "ScreenTitle": screenTitle,
      };
}
