import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const kPrimaryKey = Color(0xff8B8EDA);
const kSecondaryKey = Color(0xffD35656);
const kPinkKey = Color(0xffE4D0D4);
const kBlackColor = Colors.black;
Color kPoppingsRedColor = const Color(0xffFF0000).withOpacity(0.2);
bool isEnglish = false;
bool isDark = false;

const k5A5A5A = Color(0xff5A5A5A);
const k323232 = Color(0xff323232);

const klightBlue = Color(0xff8B8EDA);
const kMoreLightBlue = Color(0xffE8EBFC);
const kDarktBlue = Color(0xff2E3191);

const List<Color> buttonGradient = [
  Color(0xff2E3191),
  Color(0xff0094D9),
  Color(0xff6DCFF6),
];

File? imageFile;
const profilePic = 'http://16.171.141.127/uploads/';

String email = Uri.encodeComponent("mansa.eg@gmail.com");
String subject = Uri.encodeComponent("Hello in Mansa ");

List<GovernmentDataModel> allBarAssociationsConst = [];

List<GovernmentDataModel> allGeneralLawConst = [];

List<GovernmentDataModel> allDistrictConst = [];

List<GovernmentDataModel> allGovernmentConst = [];

List<GradesRegistrationModel> allGradesRegistrationConst = [];
