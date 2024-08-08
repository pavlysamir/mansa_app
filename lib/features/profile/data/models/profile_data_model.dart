class PrrofileResponseData {
  bool isSuccess;
  num version;
  dynamic message; // It can be of any type, so dynamic is used
  ProfileResponse responseData;
  dynamic errors; // It can be of any type, so dynamic is used

  PrrofileResponseData({
    required this.isSuccess,
    required this.version,
    required this.message,
    required this.responseData,
    required this.errors,
  });

  factory PrrofileResponseData.fromJson(Map<String, dynamic> json) {
    return PrrofileResponseData(
      isSuccess: json['isSuccess'] ?? false,
      version: json['version'] ?? 0,
      message: json['message'],
      responseData: ProfileResponse.fromJson(json['responseData'] ?? {}),
      errors: json['errors'],
    );
  }
}

class ProfileResponse {
  Profile profileData;

  ProfileResponse({
    required this.profileData,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      profileData: Profile.fromJson(json['profileData'] ?? {}),
    );
  }
}

class Profile {
  int userId;
  String name;
  String mobileNo;
  String email;
  num registrationGradeId;
  int generalLawBachelorId;
  int barAssociationsId;
  num governorateId;
  num districtId;
  String registrationGrade;
  dynamic generalLawBachelor; // It can be of any type, so dynamic is used
  dynamic barAssociation; // It can be of any type, so dynamic is used
  String? registrationNumber;
  String? address;
  String? description; // It can be of any type, so dynamic is used
  List<SpecializationField> specializationFields;
  List<AvailableWork> availableWorks;
  Picture? picture;

  Profile({
    required this.userId,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.registrationGradeId,
    required this.generalLawBachelorId,
    required this.barAssociationsId,
    required this.governorateId,
    required this.districtId,
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

  factory Profile.fromJson(Map<String, dynamic> json) {
    var specializationFieldsList =
        json['specializationFields'] as List<dynamic>?;
    List<SpecializationField> specializationFields =
        specializationFieldsList != null
            ? specializationFieldsList
                .map((fieldJson) => SpecializationField.fromJson(fieldJson))
                .toList()
            : [];

    var availableWorksList = json['availableWorks'] as List<dynamic>?;
    List<AvailableWork> availableWorks = availableWorksList != null
        ? availableWorksList
            .map((workJson) => AvailableWork.fromJson(workJson))
            .toList()
        : [];

    return Profile(
      userId: json['userId'] ?? 0,
      name: json['name'] ?? '',
      mobileNo: json['mobileNo'] ?? '',
      email: json['email'] ?? '',
      registrationGradeId: json['registrationGradeId'] ?? 0,
      generalLawBachelorId: json['generalLawBachelorId'] ?? 0,
      barAssociationsId: json['barAssociationsId'] ?? 0,
      governorateId: json['governorateId'] ?? 0,
      districtId: json['districtId'] ?? 0,
      registrationGrade: json['registrationGrade'] ?? '',
      generalLawBachelor: json['generalLawBachelor'],
      barAssociation: json['barAssociation'],
      registrationNumber: json['registrationNumber'] ?? '',
      address: json['address'] ?? '',
      description: json['description'],
      specializationFields: specializationFields,
      availableWorks: availableWorks,
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
    );
  }
}

class SpecializationField {
  num specializationFieldId;
  String name;
  bool isPrimary;

  SpecializationField({
    required this.specializationFieldId,
    required this.name,
    required this.isPrimary,
  });

  factory SpecializationField.fromJson(Map<String, dynamic> json) {
    return SpecializationField(
      specializationFieldId: json['specializationFieldId'] ?? 0,
      name: json['name'] ?? '',
      isPrimary: json['isPrimary'] ?? false,
    );
  }
}

class AvailableWork {
  num availabilityWorkId;
  String name;
  dynamic description; // It can be of any type, so dynamic is used

  AvailableWork({
    required this.availabilityWorkId,
    required this.name,
    required this.description,
  });

  factory AvailableWork.fromJson(Map<String, dynamic> json) {
    return AvailableWork(
      availabilityWorkId: json['availabilityWorkId'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
    );
  }
}

class Picture {
  num fileTypetId;
  dynamic fileTypeName; // It can be of any type, so dynamic is used
  String url;
  String fileName;
  String description;

  Picture({
    required this.fileTypetId,
    required this.fileTypeName,
    required this.url,
    required this.fileName,
    required this.description,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      fileTypetId: json['fileTypetId'] ?? 0,
      fileTypeName: json['fileTypeName'],
      url: json['url'] ?? '',
      fileName: json['fileName'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
