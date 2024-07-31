class BalanceModel {
  final bool isSuccess;
  final num version;
  final String? message;
  final List<ResponseBalanceData>? responseData;
  final dynamic errors;

  BalanceModel({
    required this.isSuccess,
    required this.version,
    this.message,
    this.responseData,
    this.errors,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      isSuccess: json['isSuccess'],
      version: json['version'],
      message: json['message'],
      responseData: json['responseData'] != null
          ? List<ResponseBalanceData>.from(
              json['responseData'].map((x) => ResponseBalanceData.fromJson(x)))
          : null,
      errors: json['errors'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'version': version,
      'message': message,
      'responseData': responseData?.map((x) => x.toJson()).toList(),
      'errors': errors,
    };
  }
}

class ResponseBalanceData {
  final num id;
  final String categoryName;
  final num count;

  ResponseBalanceData({
    required this.id,
    required this.categoryName,
    required this.count,
  });

  factory ResponseBalanceData.fromJson(Map<String, dynamic> json) {
    return ResponseBalanceData(
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
