import 'package:web_task1/model/device_detail.dart';

class Smartphone {
  String? grade;
  String? label;
  String? desc;
  String? price;
  DeviceDetails? deviceDetails;

  Smartphone(
      {this.grade, this.label, this.desc, this.price, this.deviceDetails});

  Smartphone.fromJson(Map<String, dynamic> json) {
    grade = json["grade"];
    label = json["label"];
    desc = json["desc"];
    price = json["price"];
    deviceDetails = json["device details"] == null
        ? null
        : DeviceDetails.fromJson(json["device details"]);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["grade"] = grade;
    data["label"] = label;
    data["desc"] = desc;
    data["price"] = price;
    if (deviceDetails != null) {
      data["device details"] = deviceDetails?.toJson();
    }
    return data;
  }

  Smartphone copyWith({
    String? grade,
    String? label,
    String? desc,
    String? price,
    DeviceDetails? deviceDetails,
  }) =>
      Smartphone(
        grade: grade ?? this.grade,
        label: label ?? this.label,
        desc: desc ?? this.desc,
        price: price ?? this.price,
        deviceDetails: deviceDetails ?? this.deviceDetails,
      );
}
