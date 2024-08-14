class User {
  final int userId;
  final String name;
  final String mobileNum;
  final String email;
  final String description;
  final String registrationGrade;
  final List<String> availableWork;
  final Picture? picture;

  User({
    required this.userId,
    required this.name,
    required this.registrationGrade,
    required this.description,
    required this.availableWork,
    required this.mobileNum,
    required this.email,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      mobileNum: json['mobileNo'],
      description: json['description'],
      email: json['email'],
      registrationGrade: json['registrationGrade'],
      availableWork: List<String>.from(json['availableWork']),
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
    );
  }
}

class Picture {
  final int fileTypetId;
  final String fileTypeName;
  final String url;
  final String fileName;
  final String description;

  Picture({
    required this.fileTypetId,
    required this.fileTypeName,
    required this.url,
    required this.fileName,
    required this.description,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      fileTypetId: json['fileTypetId'],
      fileTypeName: json['fileTypeName'],
      url: json['url'],
      fileName: json['fileName'],
      description: json['description'],
    );
  }
}

class ApiResponse {
  final bool isSuccess;
  final double version;
  final String? message;
  final ResponseData responseData;
  final dynamic errors;

  ApiResponse({
    required this.isSuccess,
    required this.version,
    this.message,
    required this.responseData,
    this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      isSuccess: json['isSuccess'],
      version: json['version'],
      message: json['message'],
      responseData: ResponseData.fromJson(json['responseData']),
      errors: json['errors'],
    );
  }
}

class ResponseData {
  final int pageIndex;
  final int pageSize;
  final int count;
  final List<User> items;

  ResponseData({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.items,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      pageIndex: json['pageIndex'],
      pageSize: json['pageSize'],
      count: json['count'],
      items: List<User>.from(json['items'].map((item) => User.fromJson(item))),
    );
  }
}
