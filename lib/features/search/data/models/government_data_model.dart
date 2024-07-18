class GovernmentDataModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final String internalCode;
  final int internalRef;
  final bool isActive;
  final String? description;
  final List<dynamic> users;
  final bool isDeleted;
  final int createdBy;
  final DateTime createdOn;
  final int? modifyBy;
  final DateTime? modifyOn;

  GovernmentDataModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.internalCode,
    required this.internalRef,
    required this.isActive,
    this.description,
    required this.users,
    required this.isDeleted,
    required this.createdBy,
    required this.createdOn,
    this.modifyBy,
    this.modifyOn,
  });

  factory GovernmentDataModel.fromJson(Map<String, dynamic> json) {
    return GovernmentDataModel(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      internalCode: json['internalCode'],
      internalRef: json['internalRef'],
      isActive: json['isActive'],
      description: json['description'],
      users: json['users'],
      isDeleted: json['isDeleted'],
      createdBy: json['createdBy'],
      createdOn: DateTime.parse(json['createdOn']),
      modifyBy: json['modifyBy'],
      modifyOn:
          json['modifyOn'] != null ? DateTime.parse(json['modifyOn']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameAr': nameAr,
      'nameEn': nameEn,
      'internalCode': internalCode,
      'internalRef': internalRef,
      'isActive': isActive,
      'description': description,
      'users': users,
      'isDeleted': isDeleted,
      'createdBy': createdBy,
      'createdOn': createdOn.toIso8601String(),
      'modifyBy': modifyBy,
      'modifyOn': modifyOn?.toIso8601String(),
    };
  }
}
