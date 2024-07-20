class UserSortedModel {
  final int generalSorting;
  final int city;

  final int district;

  final int registrationGrade;

  final int specializationField;

  UserSortedModel({
    required this.generalSorting,
    required this.city,
    required this.district,
    required this.registrationGrade,
    required this.specializationField,
  });

  factory UserSortedModel.fromJson(Map<String, dynamic> json) {
    return UserSortedModel(
      generalSorting: json['generalSorting'],
      city: json['city'],
      district: json['district'],
      registrationGrade: json['registrationGrade'],
      specializationField: json['specializationField'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'generalSorting': generalSorting,
      'city': city,
      'district': district,
      'registrationGrade': registrationGrade,
      'specializationField': specializationField,
    };
  }
}
