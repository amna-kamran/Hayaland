import 'package:web_task1/view/model/smartphone.dart';

class AppleSmartphone {
  List<Smartphone>? smartphone;

  AppleSmartphone({this.smartphone});

  AppleSmartphone.fromJson(Map<String, dynamic> json) {
    smartphone = json["apple_items"] == null
        ? null
        : (json["apple_items"] as List)
            .map((e) => Smartphone.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (smartphone != null) {
      data["apple_items"] = smartphone?.map((e) => e.toJson()).toList();
    }
    return data;
  }

  AppleSmartphone copyWith({
    List<Smartphone>? smartphone,
  }) =>
      AppleSmartphone(
        smartphone: smartphone ?? this.smartphone,
      );
}
