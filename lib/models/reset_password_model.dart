class ResetPasswordModel {
  ResetPasswordModel({
    required this.status,
    required this.token,
  });

  String status;
  String token;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
      };
}
