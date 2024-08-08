class GivenUsersResponseModel {
  final bool isSuccess;
  final num version;
  final String? message;
  final ResponseData responseData;
  final List<String>? errors;

  GivenUsersResponseModel({
    required this.isSuccess,
    required this.version,
    this.message,
    required this.responseData,
    this.errors,
  });

  factory GivenUsersResponseModel.fromJson(Map<String, dynamic> json) {
    return GivenUsersResponseModel(
      isSuccess: json['isSuccess'],
      version: json['version'],
      message: json['message'],
      responseData: ResponseData.fromJson(json['responseData']),
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'version': version,
      'message': message,
      'responseData': responseData.toJson(),
      'errors': errors,
    };
  }
}

class ResponseData {
  final List<GivenUser> givenUsers;

  ResponseData({required this.givenUsers});

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      givenUsers: List<GivenUser>.from(
        json['givenUsers'].map((x) => GivenUser.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'givenUsers': givenUsers.map((x) => x.toJson()).toList(),
    };
  }
}

class GivenUser {
  final UserData userData;
  final List<CategoryData> categories;

  GivenUser({
    required this.userData,
    required this.categories,
  });

  factory GivenUser.fromJson(Map<String, dynamic> json) {
    return GivenUser(
      userData: UserData.fromJson(json['userData']),
      categories: List<CategoryData>.from(
        json['categories'].map((x) => CategoryData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userData': userData.toJson(),
      'categories': categories.map((x) => x.toJson()).toList(),
    };
  }
}

class UserData {
  final num userId;
  final String name;
  final String registrationGrade;
  final List<String> availableWork;
  final String? status;
  final Picture? picture;

  UserData({
    required this.userId,
    required this.name,
    required this.registrationGrade,
    required this.availableWork,
    this.status,
    this.picture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json['userId'],
      name: json['name'],
      registrationGrade: json['registrationGrade'],
      availableWork: List<String>.from(json['availableWork']),
      status: json['status'],
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'registrationGrade': registrationGrade,
      'availableWork': availableWork,
      'status': status,
      'picture': picture,
    };
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

class CategoryData {
  final num id;
  final String categoryName;
  final num count;

  CategoryData({
    required this.id,
    required this.categoryName,
    required this.count,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      categoryName: json['categoryName'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'count': count,
    };
  }
}
