class ProfileSettingModel {
  final bool isSuccess;
  final num version;
  final String? message;
  final User? responseData;
  final dynamic errors;

  ProfileSettingModel({
    required this.isSuccess,
    required this.version,
    this.message,
    this.responseData,
    this.errors,
  });

  factory ProfileSettingModel.fromJson(Map<String, dynamic> json) {
    return ProfileSettingModel(
      isSuccess: json['isSuccess'],
      version: json['version'],
      message: json['message'],
      responseData: json['responseData'] != null
          ? User.fromJson(json['responseData'])
          : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'version': version,
      'message': message,
      'responseData': responseData?.toJson(),
      'errors': errors,
    };
  }
}

class User {
  final num userId;
  final String name;
  final String mobileNo;
  final String email;
  final num registrationGradeId;
  final num generalLawBachelorId;
  final num barAssociationsId;
  final num? governorateId;
  final num? districtId;
  final String registrationGrade;
  final String? generalLawBachelor;
  final String? barAssociation;
  final String? registrationNumber;
  final String? address;
  final String? description;
  final List<dynamic> specializationFields;
  final List<dynamic> availableWorks;
  final String? picture;

  User({
    required this.userId,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.registrationGradeId,
    required this.generalLawBachelorId,
    required this.barAssociationsId,
    this.governorateId,
    this.districtId,
    required this.registrationGrade,
    this.generalLawBachelor,
    this.barAssociation,
    this.registrationNumber,
    this.address,
    this.description,
    required this.specializationFields,
    required this.availableWorks,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      mobileNo: json['mobileNo'],
      email: json['email'],
      registrationGradeId: json['registrationGradeId'],
      generalLawBachelorId: json['generalLawBachelorId'],
      barAssociationsId: json['barAssociationsId'],
      governorateId: json['governorateId'],
      districtId: json['districtId'],
      registrationGrade: json['registrationGrade'],
      generalLawBachelor: json['generalLawBachelor'],
      barAssociation: json['barAssociation'],
      registrationNumber: json['registrationNumber'],
      address: json['address'],
      description: json['description'],
      specializationFields: List<dynamic>.from(json['specializationFields']),
      availableWorks: List<dynamic>.from(json['availableWorks']),
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'mobileNo': mobileNo,
      'email': email,
      'registrationGradeId': registrationGradeId,
      'generalLawBachelorId': generalLawBachelorId,
      'barAssociationsId': barAssociationsId,
      'governorateId': governorateId,
      'districtId': districtId,
      'registrationGrade': registrationGrade,
      'generalLawBachelor': generalLawBachelor,
      'barAssociation': barAssociation,
      'registrationNumber': registrationNumber,
      'address': address,
      'description': description,
      'specializationFields': specializationFields,
      'availableWorks': availableWorks,
      'picture': picture,
    };
  }
}
