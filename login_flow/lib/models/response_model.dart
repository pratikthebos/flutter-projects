import 'user_model.dart';

class ResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final UserModel user;

  const ResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.user,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      success: json["success"],
      statusCode: json["statusCode"],
      message: json["message"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "statusCode": statusCode,
      "message": message,
      "user": user.toJson(),
    };
  }
}