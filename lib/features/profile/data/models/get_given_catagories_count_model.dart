class GetGivenCatagoriesCountModel {
  bool isSuccess;
  num version;
  String message;
  List<CategoryMedalData> responseData;
  dynamic errors; // Can be of any type, based on your API response

  GetGivenCatagoriesCountModel({
    required this.isSuccess,
    required this.version,
    required this.message,
    required this.responseData,
    required this.errors,
  });

  factory GetGivenCatagoriesCountModel.fromJson(Map<String, dynamic> json) {
    return GetGivenCatagoriesCountModel(
      isSuccess: json['isSuccess'] ?? false,
      version: json['version'] ?? 0,
      message: json['message'] ?? '',
      responseData: (json['responseData'] as List)
          .map((item) => CategoryMedalData.fromJson(item))
          .toList(),
      errors: json['errors'],
    );
  }
}

class CategoryMedalData {
  num id;
  String categoryName;
  num count;

  CategoryMedalData({
    required this.id,
    required this.categoryName,
    required this.count,
  });

  factory CategoryMedalData.fromJson(Map<String, dynamic> json) {
    return CategoryMedalData(
      id: json['id'] ?? 0,
      categoryName: json['categoryName'] ?? '',
      count: json['count'] ?? 0,
    );
  }
}
