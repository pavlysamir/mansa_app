import 'dart:convert';

// Model for the entire JSON structure
class LawyerData {
  String? name;
  String? mobileNo;
  String? email;
  int? registrationGradeId;
  int? generalLawBachelorId;
  int? barAssociationsId;
  int? governorateId;
  int? districtId;
  String? registrationNumber;
  String? address;
  String? description;
  List<SpecializationField>? specializationFields;
  List<AvailabilityWork>? availableWorks;
  Picture? picture;

  LawyerData({
    this.name,
    this.mobileNo,
    this.email,
    this.registrationGradeId,
    this.generalLawBachelorId,
    this.barAssociationsId,
    this.governorateId,
    this.districtId,
    this.registrationNumber,
    this.address,
    this.description,
    this.specializationFields,
    this.availableWorks,
    this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobileNo': mobileNo,
      'email': email,
      'registrationGradeId': registrationGradeId,
      'generalLawBachelorId': generalLawBachelorId,
      'barAssociationsId': barAssociationsId,
      'governorateId': governorateId,
      'districtId': districtId,
      'registrationNumber': registrationNumber,
      'address': address,
      'description': description,
      'specializationFields':
          specializationFields!.map((e) => e.toMap()).toList(),
      'availableWorks': availableWorks!.map((e) => e.toMap()).toList(),
      'picture': picture!.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  factory LawyerData.fromJson(String source) =>
      LawyerData.fromMap(json.decode(source));

  factory LawyerData.fromMap(Map<String, dynamic> map) {
    return LawyerData(
      name: map['name'],
      mobileNo: map['mobileNo'],
      email: map['email'],
      registrationGradeId: map['registrationGradeId'],
      generalLawBachelorId: map['generalLawBachelorId'],
      barAssociationsId: map['barAssociationsId'],
      governorateId: map['governorateId'],
      districtId: map['districtId'],
      registrationNumber: map['registrationNumber'],
      address: map['address'],
      description: map['description'],
      specializationFields: List<SpecializationField>.from(
          map['specializationFields']
              ?.map((x) => SpecializationField.fromMap(x))),
      availableWorks: List<AvailabilityWork>.from(
          map['availableWorks']?.map((x) => AvailabilityWork.fromMap(x))),
      picture: Picture.fromMap(map['picture']),
    );
  }
}

// Model for SpecializationField
class SpecializationField {
  int specializationFieldId;
  bool isPrimary;

  SpecializationField({
    required this.specializationFieldId,
    required this.isPrimary,
  });

  Map<String, dynamic> toMap() {
    return {
      'specializationFieldId': specializationFieldId,
      'isPrimary': isPrimary,
    };
  }

  factory SpecializationField.fromMap(Map<String, dynamic> map) {
    return SpecializationField(
      specializationFieldId: map['specializationFieldId'],
      isPrimary: map['isPrimary'],
    );
  }
}

// Model for AvailabilityWork
class AvailabilityWork {
  int availabilityWorkId;
  String description;

  AvailabilityWork({
    required this.availabilityWorkId,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'availabilityWorkId': availabilityWorkId,
      'description': description,
    };
  }

  factory AvailabilityWork.fromMap(Map<String, dynamic> map) {
    return AvailabilityWork(
      availabilityWorkId: map['availabilityWorkId'],
      description: map['description'],
    );
  }
}

// Model for Picture
class Picture {
  String file;
  int fileTypeId;

  Picture({
    required this.file,
    required this.fileTypeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'file': file,
      'fileTypeId': fileTypeId,
    };
  }

  factory Picture.fromMap(Map<String, dynamic> map) {
    return Picture(
      file: map['file'],
      fileTypeId: map['fileTypeId'],
    );
  }
}
