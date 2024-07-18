import 'package:mansa_app/core/api/end_ponits.dart';

class ErrorModel {
  final String? errorMessage;
  final List<dynamic> errors;

  ErrorModel({
    required this.errorMessage,
    required this.errors,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.errorMessage] ?? 'Unknown error',
      errors: jsonData[ApiKey.errors] ?? ['Unknown error'],
    );
  }
}
