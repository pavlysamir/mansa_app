// class LoginUserModel {
//   final String id;
//   final String userName;
//   final String email;
//   final String phoneNumber;
//   final String token;
//   final String code;

//   LoginUserModel({
//     required this.id,
//     required this.userName,
//     required this.email,
//     required this.phoneNumber,
//     required this.token,
//     required this.code,
//   });

//   factory LoginUserModel.fromJson(Map<String, dynamic> json) {
//     return LoginUserModel(
//         id: json['id'],
//         userName: json['userName'],
//         email: json['email'],
//         phoneNumber: json['phoneNumber'],
//         token: json['token'],
//         code: json['code']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'userName': userName,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'token': token,
//       'code': code
//     };
//   }
// }

class LoginUserModel {
  String id;
  String userName;
  String email;
  String phoneNumber;
  String code;
  PictureModel picture;
  String token;

  LoginUserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.code,
    required this.picture,
    required this.token,
  });

  // Factory constructor to create a new UserModel instance from a map
  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      code: json['code'],
      picture: PictureModel.fromJson(json['picture']),
      token: json['token'],
    );
  }

  // Method to convert UserModel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'code': code,
      'picture': picture.toJson(),
      'token': token,
    };
  }
}

class PictureModel {
  int fileTypetId;
  String? fileTypeName;
  String url;
  String fileName;
  String description;

  PictureModel({
    required this.fileTypetId,
    this.fileTypeName,
    required this.url,
    required this.fileName,
    required this.description,
  });

  // Factory constructor to create a new PictureModel instance from a map
  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      fileTypetId: json['fileTypetId'],
      fileTypeName: json['fileTypeName'],
      url: json['url'],
      fileName: json['fileName'],
      description: json['description'],
    );
  }

  // Method to convert PictureModel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'fileTypetId': fileTypetId,
      'fileTypeName': fileTypeName,
      'url': url,
      'fileName': fileName,
      'description': description,
    };
  }
}
