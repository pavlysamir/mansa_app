class LoginUserModel {
  final int id;
  final String userName;
  final String email;
  final String phoneNumber;
  final String token;

  LoginUserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.token,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'token': token,
    };
  }
}
