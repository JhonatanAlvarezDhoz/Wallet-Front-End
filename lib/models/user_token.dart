class UserToken {
  UserToken({
    this.refresh,
    this.access,
  });

  String? refresh;
  String? access;

  factory UserToken.fromMap(Map<String, dynamic> json) => UserToken(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toMap() => {
        "refresh": refresh,
        "access": access,
      };
}
