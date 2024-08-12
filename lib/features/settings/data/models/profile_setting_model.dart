class ProfileSettingModel {
  final bool isSuccess;
  final num version;
  final String? message;
  final UserResponseData? responseData;
  final List<String>? errors;

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
          ? UserResponseData.fromJson(json['responseData'])
          : null,
      errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
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

class UserResponseData {
  final num userId;
  final String name;
  final String mobileNo;
  final String? email;
  final int registrationGradeId;
  final int? generalLawBachelorId;
  final int? barAssociationsId;
  final int? governorateId;
  final int? districtId;
  final String? registrationGrade;
  final String? generalLawBachelor;
  final String? barAssociation;
  final String? registrationNumber;
  final String? address;
  final String? description;
  final List<SpecializationField> specializationFields;
  final List<AvailableWork> availableWorks;
  final Picture? picture;

  UserResponseData({
    required this.userId,
    required this.name,
    required this.mobileNo,
    this.email,
    required this.registrationGradeId,
    this.generalLawBachelorId,
    this.barAssociationsId,
    this.governorateId,
    this.districtId,
    this.registrationGrade,
    this.generalLawBachelor,
    this.barAssociation,
    this.registrationNumber,
    this.address,
    this.description,
    required this.specializationFields,
    required this.availableWorks,
    this.picture,
  });

  factory UserResponseData.fromJson(Map<String, dynamic> json) {
    return UserResponseData(
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
      specializationFields: (json['specializationFields'] as List)
          .map((i) => SpecializationField.fromJson(i))
          .toList(),
      availableWorks: (json['availableWorks'] as List)
          .map((i) => AvailableWork.fromJson(i))
          .toList(),
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
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
      'specializationFields':
          specializationFields.map((i) => i.toJson()).toList(),
      'availableWorks': availableWorks.map((i) => i.toJson()).toList(),
      'picture': picture?.toJson(),
    };
  }
}

class SpecializationField {
  final int specializationFieldId;
  final String name;
  final bool isPrimary;

  SpecializationField({
    required this.specializationFieldId,
    required this.name,
    required this.isPrimary,
  });

  factory SpecializationField.fromJson(Map<String, dynamic> json) {
    return SpecializationField(
      specializationFieldId: json['specializationFieldId'],
      name: json['name'],
      isPrimary: json['isPrimary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specializationFieldId': specializationFieldId,
      'name': name,
      'isPrimary': isPrimary,
    };
  }
}

class AvailableWork {
  final int availabilityWorkId;
  final String name;
  final String? description;

  AvailableWork({
    required this.availabilityWorkId,
    required this.name,
    this.description,
  });

  factory AvailableWork.fromJson(Map<String, dynamic> json) {
    return AvailableWork(
      availabilityWorkId: json['availabilityWorkId'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'availabilityWorkId': availabilityWorkId,
      'name': name,
      'description': description,
    };
  }
}

class Picture {
  final num fileTypetId;
  final String? fileTypeName;
  final String url;
  final String fileName;
  final String? description;

  Picture({
    required this.fileTypetId,
    this.fileTypeName,
    required this.url,
    required this.fileName,
    this.description,
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



//ProfileSettingModel