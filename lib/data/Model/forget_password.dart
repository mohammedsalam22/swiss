
class ForgetPasswordModel {
  String email;

  ForgetPasswordModel({required this.email});

  factory ForgetPasswordModel.initial() => ForgetPasswordModel(email: '');

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      email: json["email"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}

class RetrivePasswordModel {
  String code;

  RetrivePasswordModel({required this.code});

  factory RetrivePasswordModel.initial() => RetrivePasswordModel(code: '');

  factory RetrivePasswordModel.fromJson(Map<String, dynamic> json) {
    return RetrivePasswordModel(
      code: json["email"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
    };
  }
}
