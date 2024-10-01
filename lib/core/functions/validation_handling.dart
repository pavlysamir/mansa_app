String? conditionOfValidationEmail(value) {
  var nonNullValue = value ?? '';
  if (nonNullValue.isEmpty) {
    return ("Email is required");
  }
  if (!nonNullValue.contains("@")) {
    return ("Email should contains @");
  }
  return null;
}

String? conditionOfValidationPassWord(value) {
  // RegExp regex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var passNonNullValue = value ?? "";
  if (passNonNullValue.isEmpty) {
    return ("Password is required");
  } else if (passNonNullValue.length < 8) {
    return ("Password must be more than 8 characters");
  }
  // else if (!regex.hasMatch(passNonNullValue)) {
  //   return ("Password should contain upper case, lower case, special character and number");
  // }
  return null;
}

String? conditionOfValidationName(value) {
  var nonNullValue = value ?? '';
  if (nonNullValue.isEmpty) {
    return 'اسم المستخدم مطلوب';
  }

  // تقسيم الاسم إلى مقاطع باستخدام المسافات
  List<String> nameParts = nonNullValue.split(' ');

  // التحقق من عدد المقاطع
  if (nameParts.length < 3) {
    return 'الاسم يجب أن يكون ثلاثي';
  }

  return null;
}

String? conditionOfValidationPhone(value) {
  var nonNullValue = value ?? '';
  if (nonNullValue.isEmpty) {
    return ('الهاتف مطلوب');
  }
  return null;
}
