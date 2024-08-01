class ProfileResponse {
  bool? isSuccess;
  num? version;
  String? message;
  PrrofileResponseData? responseData;
  List<String>? errors;

  ProfileResponse(
      {this.isSuccess,
      this.version,
      this.message,
      this.responseData,
      this.errors});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    version = json['version'];
    message = json['message'];
    responseData = json['responseData'] != null
        ? PrrofileResponseData.fromJson(json['responseData'])
        : null;
    errors = json['errors'] != null ? List<String>.from(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['isSuccess'] = isSuccess;
    data['version'] = version;
    data['message'] = message;
    if (responseData != null) {
      data['responseData'] = responseData!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

class PrrofileResponseData {
  ProfileData? profileData;

  PrrofileResponseData({this.profileData});

  PrrofileResponseData.fromJson(Map<String, dynamic> json) {
    profileData = json['profileData'] != null
        ? ProfileData.fromJson(json['profileData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (profileData != null) {
      data['profileData'] = profileData!.toJson();
    }
    return data;
  }
}

class ProfileData {
  num? userId;
  String? name;
  String? mobileNo;
  String? email;
  num? registrationGradeId;
  num? generalLawBachelorId;
  num? barAssociationsId;
  dynamic governorateId;
  dynamic districtId;
  String? registrationGrade;
  dynamic generalLawBachelor;
  dynamic barAssociation;
  dynamic registrationNumber;
  dynamic address;
  dynamic description;
  List<dynamic>? specializationFields;
  List<dynamic>? availableWorks;
  dynamic picture;

  ProfileData({
    this.userId,
    this.name,
    this.mobileNo,
    this.email,
    this.registrationGradeId,
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
    this.specializationFields,
    this.availableWorks,
    this.picture,
  });

  ProfileData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    registrationGradeId = json['registrationGradeId'];
    generalLawBachelorId = json['generalLawBachelorId'];
    barAssociationsId = json['barAssociationsId'];
    governorateId = json['governorateId'];
    districtId = json['districtId'];
    registrationGrade = json['registrationGrade'];
    generalLawBachelor = json['generalLawBachelor'];
    barAssociation = json['barAssociation'];
    registrationNumber = json['registrationNumber'];
    address = json['address'];
    description = json['description'];
    specializationFields = json['specializationFields'] != null
        ? List<dynamic>.from(json['specializationFields'])
        : null;
    availableWorks = json['availableWorks'] != null
        ? List<dynamic>.from(json['availableWorks'])
        : null;
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['name'] = name;
    data['mobileNo'] = mobileNo;
    data['email'] = email;
    data['registrationGradeId'] = registrationGradeId;
    data['generalLawBachelorId'] = generalLawBachelorId;
    data['barAssociationsId'] = barAssociationsId;
    data['governorateId'] = governorateId;
    data['districtId'] = districtId;
    data['registrationGrade'] = registrationGrade;
    data['generalLawBachelor'] = generalLawBachelor;
    data['barAssociation'] = barAssociation;
    data['registrationNumber'] = registrationNumber;
    data['address'] = address;
    data['description'] = description;
    data['specializationFields'] = specializationFields;
    data['availableWorks'] = availableWorks;
    data['picture'] = picture;
    return data;
  }
}
