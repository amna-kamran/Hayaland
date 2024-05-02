class DeviceDetails {
  String? deviceType;
  String? model;
  String? imeiNumber;
  String? carrier;
  String? color;
  String? maximumBatteryCapacity;
  String? accessories;
  String? malfunction;
  String? grade;
  String? exteriorDetails;

  DeviceDetails(
      this.deviceType,
      this.model,
      this.imeiNumber,
      this.carrier,
      this.color,
      this.maximumBatteryCapacity,
      this.accessories,
      this.malfunction,
      this.grade,
      this.exteriorDetails);

  DeviceDetails.fromJson(Map<String, dynamic> json) {
    deviceType = json["Device Type"];
    model = json["Model"];
    imeiNumber = json["IMEI Number"];
    carrier = json["Carrier"];
    color = json["Color"];
    maximumBatteryCapacity = json["Maximum Battery Capacity"];
    accessories = json["Accessories"];
    malfunction = json["Malfunction"];
    grade = json["Grade"];
    exteriorDetails = json["Exterior Details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Device Type"] = deviceType;
    data["Model"] = model;
    data["IMEI Number"] = imeiNumber;
    data["Carrier"] = carrier;
    data["Color"] = color;
    data["Maximum Battery Capacity"] = maximumBatteryCapacity;
    data["Accessories"] = accessories;
    data["Malfunction"] = malfunction;
    data["Grade"] = grade;
    data["Exterior Details"] = exteriorDetails;
    return data;
  }
}
