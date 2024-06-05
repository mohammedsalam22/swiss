class RegisterModel {
  String phone;
  String name;
  String type;

  RegisterModel({required this.phone, required this.name, required this.type});

  factory RegisterModel.initial() =>
      RegisterModel(phone: '', name: '', type: '');

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      phone: json["phone"] ?? '',
      name: json["name"] ?? '',
      type: json["type"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "name": name,
      "type": type,
    };
  }
}
