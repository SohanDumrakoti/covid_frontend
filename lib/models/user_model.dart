class UserModel {
  final String? token;
  final String? email;
  final String? password;
  final String? message;
  UserModel({
    this.token,
    this.email,
    this.password,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      message: json['message'],
      token: json["token"],
    );
  }
}
