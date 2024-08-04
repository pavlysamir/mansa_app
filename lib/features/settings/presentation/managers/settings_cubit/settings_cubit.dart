import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Theme/Teme_data.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
import 'package:mansa_app/features/settings/data/models/balance_model.dart';
import 'package:mansa_app/features/settings/data/models/given_user_model.dart';
import 'package:mansa_app/features/settings/data/models/profile_setting_model.dart';
import 'package:mansa_app/features/settings/data/repo/settings_repo.dart';
import 'package:meta/meta.dart';
import 'package:image/image.dart' as img;

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepo) : super(SettingsInitial());

  static SettingsCubit? get(context) => BlocProvider.of(context);

  final SettingsRepo settingsRepo;

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController resetPasswordController = TextEditingController();

  TextEditingController adressOfficeController = TextEditingController();

  TextEditingController lawyerVisionController = TextEditingController();

  TextEditingController kedDegreeController = TextEditingController();

  TextEditingController kedNumberController = TextEditingController();

  TextEditingController putYourVisionController = TextEditingController();

  TextEditingController codeController = TextEditingController();

  var editProfileKey = GlobalKey<FormState>();

  String? base64BackImage;
  File? file;

  Future<void> pickCameraImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Read the image file
      final bytes = await File(image.path).readAsBytes();
      // Decode the image
      img.Image? originalImage = img.decodeImage(bytes);

      if (originalImage != null) {
        // Resize the image to a smaller size (e.g., width 600 pixels)
        img.Image resizedImage = img.copyResize(originalImage, width: 600);

        // Compress the image (optional)
        List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 30);

        base64BackImage = base64Encode(compressedBytes);
        file = File(image.path);
        if (kDebugMode) {
          print(file!.path);
        }

        // Emit success state
        emit(SuccessfulPickImage());
      } else {
        emit(FailPickImage());
      }
    } else {
      emit(FailPickImage());
    }
  }

  List<GradesRegistrationModel> allGradesRegistration = [];
  List<String> namesOfGrades = [];
  Future<void> getAllGradesRegistration() async {
    // emit(GetAllSubjectsRegistrationLoading());
    final response = await settingsRepo.getAllGradesRegistration();

    response.fold(
      (errMessage) => emit(GetAllGradesRegistrationFail(errMessage)),
      (allGrades) {
        allGradesRegistration = allGrades;
        saveListInSharedPreferences(
            key: ApiKey.allgradesRegisters, list: allGradesRegistration);
        for (var element in allGradesRegistration) {
          namesOfGrades.add(element.nameAr);
        }
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.namesOfGrades, value: namesOfGrades);
        grade = namesOfGrades.first;
        gradeId = allGradesRegistration.first.id;
        //  emit(GetAllGradesRegistrationSuccess());
      },
    );
  }

  void saveListInSharedPreferences(
      {required List<dynamic> list, required String key}) async {
    final listValue = jsonEncode(list.map((item) => item.toJson()).toList());
    await getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: key, value: listValue);
  }

  late String grade;
  late int gradeId;

  void selectGrade(String grade) {
    this.grade = grade;
    for (var element in getIt.get<CashHelperSharedPreferences>().getData(
          key: ApiKey.namesOfGrades,
        )) {
      if (element.nameAr == grade) {
        gradeId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.grade}  ${gradeId.toString()}');
    }
    emit(SelectedGradRegistration());
  }

  List<int> availabilityToWordIds = [];

  void clickAvalabilityToWork(int id) {
    mapAvalabilityToWork[id] = !mapAvalabilityToWork[id]!;

    addClickAvailabilityToWorkToList(id);
    emit(SearchClick());
  }

  void addClickAvailabilityToWorkToList(int id) {
    if (mapAvalabilityToWork[id] == true) {
      availabilityToWordIds.add(id);
      print(availabilityToWordIds.toString());
    } else {
      availabilityToWordIds.remove(id);
      print(availabilityToWordIds.toString());
    }
  }

  Map<int, bool> mapAvalabilityToWork = {};

  List<AvailibalityWorkModel> allAvalabilityToWork = [];
  List<String> namesOfAvalabilityToWork = [];
  List<int> idsOfAvalabilityToWork = [];

  Future<void> getAllAvalabilityToWork() async {
    // emit(GetAllAvalabalityOfWorkLoading());
    final response = await settingsRepo.getAllAvailabalityWork();

    response.fold(
      (errMessage) => emit(GetAllAvalabalityOfWorkFail(errMessage)),
      (allAvalable) {
        allAvalabilityToWork = allAvalable;
        for (var element in allAvalabilityToWork) {
          namesOfAvalabilityToWork.add(element.nameAr);
          idsOfAvalabilityToWork.add(element.id);

          mapAvalabilityToWork[element.id] = false;
        }

        //  emit(GetAllAvalabalityOfWorkSuccess());
      },
    );
  }

  List<GovernmentDataModel> allGovernments = [];
  List<String> namesOfGovernments = [];
  List<int> idsOfGovernments = [];

  Future<void> getAllGovernmentsk() async {
    // emit(GetAllGovernmentsLoading());
    final response = await settingsRepo.getAllGovernment();

    response.fold(
      (errMessage) => emit(GetAllGovernmentsFail(errMessage)),
      (allGov) {
        allGovernments = allGov;
        for (var element in allGovernments) {
          namesOfGovernments.add(element.nameAr);
          idsOfGovernments.add(element.id);
        }
        government = namesOfGovernments.first;
        // governmentId = allGovernments.first.id;
        // emit(GetAllGovernmentsSuccess());
      },
    );
  }

  List<GovernmentDataModel> allDistricts = [];
  List<String> namesOfDistricts = [];
  List<int> idsOfDistricts = [];

  Future<void> getAllDistricts() async {
    // emit(GetAllDistrictsLoading());
    final response = await settingsRepo.getAllDistrict();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allDis) {
        allDistricts = allDis;
        for (var element in allDistricts) {
          namesOfDistricts.add(element.nameAr);
          idsOfDistricts.add(element.id);
        }
        district = namesOfDistricts.first;
        // districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  late String government;
  int? governmentId;

  void selectGovernment(String government) {
    this.government = government;
    for (var element in allGovernments) {
      if (element.nameAr == government) {
        governmentId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.government}  ${governmentId.toString()}');
    }
    emit(SelectedGovernment());
  }

  late String district;
  int? districtId;

  void selectDistrict(String district) {
    this.district = district;
    for (var element in allDistricts) {
      if (element.nameAr == district) {
        districtId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.district}  ${districtId.toString()}');
    }
    emit(SelectedDistrict());
  }

  List<GovernmentDataModel> allBarAssociations = [];
  List<String> namesOfBarAssociations = [];
  List<int> idsOfBarAssociations = [];

  Future<void> getAllBarAssociations() async {
    // emit(GetAllDistrictsLoading());
    final response = await settingsRepo.getAllBarAssociations();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allAssoci) {
        allBarAssociations = allAssoci;
        for (var element in allBarAssociations) {
          namesOfBarAssociations.add(element.nameAr);
          idsOfBarAssociations.add(element.id);
        }
        association = namesOfBarAssociations.first;
        // districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  late String association;
  int? associationId;

  void selectAssociation(String association) {
    this.association = association;
    for (var element in allBarAssociations) {
      if (element.nameAr == association) {
        districtId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.association}  ${associationId.toString()}');
    }
    emit(SelectedAssociation());
  }

  // Properties for GeneralLawBachelor
  List<GovernmentDataModel> allGeneralLawBachelor = [];
  List<String> namesOfGeneralLawBachelor = [];
  List<int> idsOfGeneralLawBachelor = [];
  late String generalLawBachelor;
  int? generalLawBachelorId;

  // Properties for GrantingUniversity
  List<GovernmentDataModel> allGrantingUniversity = [];
  List<String> namesOfGrantingUniversity = [];
  List<int> idsOfGrantingUniversity = [];
  late String grantingUniversity;
  int? grantingUniversityId;

  // Properties for PostgraduateStudy
  List<GovernmentDataModel> allPostgraduateStudy = [];
  List<String> namesOfPostgraduateStudy = [];
  List<int> idsOfPostgraduateStudy = [];
  late String postgraduateStudy;
  int? postgraduateStudyId;

  // Properties for SpecializationField
  List<GovernmentDataModel> allSpecializationField = [];
  List<String> namesOfSpecializationField = [];
  List<int> idsOfSpecializationField = [];
  late String specializationField;
  int? specializationFieldId;

  // Method to get all GeneralLawBachelor
  Future<void> getAllGeneralLawBachelor() async {
    final response = await settingsRepo.getAllGeneralLawBachelor();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allBachelors) {
        allGeneralLawBachelor = allBachelors;
        for (var element in allGeneralLawBachelor) {
          namesOfGeneralLawBachelor.add(element.nameAr);
          idsOfGeneralLawBachelor.add(element.id);
        }
        if (namesOfGeneralLawBachelor.isNotEmpty) {
          generalLawBachelor = namesOfGeneralLawBachelor.first;
          generalLawBachelorId = allGeneralLawBachelor.first.id;
        }
        //  emit(GetAllGeneralLawBachelorSuccess());
      },
    );
  }

  // Method to select GeneralLawBachelor
  void selectGeneralLawBachelor(String generalLawBachelor) {
    this.generalLawBachelor = generalLawBachelor;
    for (var element in allGeneralLawBachelor) {
      if (element.nameAr == generalLawBachelor) {
        generalLawBachelorId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.generalLawBachelor}  ${generalLawBachelorId.toString()}');
    }
    emit(SelectedGeneralLawBachelor());
  }

  // Method to get all GrantingUniversity
  Future<void> getAllGrantingUniversity() async {
    final response = await settingsRepo.getAllGrantingUniversity();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allUniversities) {
        allGrantingUniversity = allUniversities;
        for (var element in allGrantingUniversity) {
          namesOfGrantingUniversity.add(element.nameAr);
          idsOfGrantingUniversity.add(element.id);
        }
        if (namesOfGrantingUniversity.isNotEmpty) {
          grantingUniversity = namesOfGrantingUniversity.first;
          grantingUniversityId = allGrantingUniversity.first.id;
        }
        // emit(GetAllGrantingUniversitySuccess());
      },
    );
  }

  // Method to select GrantingUniversity
  void selectGrantingUniversity(String grantingUniversity) {
    this.grantingUniversity = grantingUniversity;
    for (var element in allGrantingUniversity) {
      if (element.nameAr == grantingUniversity) {
        grantingUniversityId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.grantingUniversity}  ${grantingUniversityId.toString()}');
    }
    emit(SelectedGrantingUniversity());
  }

  // Method to get all PostgraduateStudy
  Future<void> getAllPostgraduateStudy() async {
    final response = await settingsRepo.getAllPostgraduateStudy();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allStudies) {
        allPostgraduateStudy = allStudies;
        for (var element in allPostgraduateStudy) {
          namesOfPostgraduateStudy.add(element.nameAr);
          idsOfPostgraduateStudy.add(element.id);
        }
        if (namesOfPostgraduateStudy.isNotEmpty) {
          postgraduateStudy = namesOfPostgraduateStudy.first;
          postgraduateStudyId = allPostgraduateStudy.first.id;
        }
        // emit(GetAllPostgraduateStudySuccess());
      },
    );
  }

  // Method to select PostgraduateStudy
  void selectPostgraduateStudy(String postgraduateStudy) {
    this.postgraduateStudy = postgraduateStudy;
    for (var element in allPostgraduateStudy) {
      if (element.nameAr == postgraduateStudy) {
        postgraduateStudyId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.postgraduateStudy}  ${postgraduateStudyId.toString()}');
    }
    emit(SelectedPostgraduateStudy());
  }

  // Method to get all SpecializationField
  Future<void> getAllSpecializationField() async {
    final response = await settingsRepo.getAllSpecializationField();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allFields) {
        allSpecializationField = allFields;
        for (var element in allSpecializationField) {
          namesOfSpecializationField.add(element.nameAr);
          idsOfSpecializationField.add(element.id);
        }
        if (namesOfSpecializationField.isNotEmpty) {
          specializationField = namesOfSpecializationField.first;
          specializationFieldId = allSpecializationField.first.id;
        }
        //emit(GetAllSpecializationFieldSuccess());
      },
    );
  }

  // Method to select SpecializationField
  void selectSpecializationField(String specializationField) {
    this.specializationField = specializationField;
    for (var element in allSpecializationField) {
      if (element.nameAr == specializationField) {
        specializationFieldId = element.id;
      }
    }
    if (kDebugMode) {
      print('${this.specializationField}  ${specializationFieldId.toString()}');
    }
    emit(SelectedSpecializationField());
  }

  Future<void> triggerGetFunctions() async {
    emit(TriggerFunctionLoading());
    await getAllGradesRegistration();
    await getAllAvalabilityToWork();
    await getAllDistricts();
    await getAllGovernmentsk();
    await getAllBarAssociations();
    await getAllGeneralLawBachelor();
    await getAllGrantingUniversity();
    await getAllPostgraduateStudy();
    await getAllSpecializationField();

    emit(TriggerFunctionSuccess());
  }

  Future<void> clearData() async {
    nameController.clear();
    availabilityToWordIds.clear();
    government = namesOfGovernments.first;
    district = namesOfDistricts.first;
    grade = namesOfGrades.first;
    gradeId = allGradesRegistration.first.id;
    districtId = allDistricts.first.id;
    governmentId = allGovernments.first.id;
    emailController.clear();
    phoneController.clear();
    putYourVisionController.clear();
    adressOfficeController.clear();

    mapAvalabilityToWork.forEach(((key, value) {
      mapAvalabilityToWork[key] = false;
    }));

    emit(ClearData());
  }

  Future<void> changeLanguage() async {
    // Toggle the language preference.
    isEnglish = !isEnglish;
    emit(ChangeLanguageSuccess());
    // Save the updated language preference.
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(
          key: 'isEnglishh',
          value: isEnglish,
        )
        .then((value) {
      if (kDebugMode) {
        print(isEnglish);
      }
    });
  }

  Future<void> changeTheme() async {
    // Toggle the language preference.
    isDark = !isDark;
    emit(ChangeThemeSuccess());
    // Save the updated language preference.
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(
          key: 'isDark',
          value: isDark,
        )
        .then((value) {
      if (kDebugMode) {
        print(isDark);
      }
    });
  }

  Locale getLocale() {
    if (getIt.get<CashHelperSharedPreferences>().getData(
              key: 'isEnglishh',
            ) ==
        null) {
      return const Locale('ar');
    } else if (getIt.get<CashHelperSharedPreferences>().getData(
          key: 'isEnglishh',
        )) {
      return const Locale('en');
    } else {
      return const Locale('ar');
    }
  }

  ThemeData getTheme() {
    if (getIt.get<CashHelperSharedPreferences>().getData(
              key: 'isDark',
            ) ==
        null) {
      return AppTheme.lightTheme;
    } else if (getIt.get<CashHelperSharedPreferences>().getData(
          key: 'isDark',
        )) {
      return AppTheme.darkTheme;
    } else {
      return AppTheme.lightTheme;
    }
  }

  ProfileSettingModel? profileSetingsData;
  Future<void> getProfileSettingData() async {
    emit(GetProfileSettingLoading());
    final response = await settingsRepo.getProfileSettingsData();

    response.fold(
      (errMessage) => emit(GetProfileSettingFail(errMessage)),
      (profileSett) {
        profileSetingsData = profileSett;
        nameController.text = profileSetingsData!.responseData!.name;
        emailController.text = profileSetingsData!.responseData!.email;
        phoneController.text = profileSetingsData!.responseData!.mobileNo;
        putYourVisionController.text =
            profileSetingsData!.responseData!.description ?? '';
        adressOfficeController.text =
            profileSetingsData!.responseData!.address ?? '';
        for (var element
            in profileSetingsData!.responseData!.specializationFields) {
          specializationFieldId = element.specializationFieldId;
          specializationField = element.name;
        }

        emit(GetProfileSettingSuccess());
      },
    );
  }

  List<ResponseBalanceData>? myBalanceData = [];
  Future<void> getMyBalanceData() async {
    emit(GetMyBalanceLoading());
    final response = await settingsRepo.getMybalance();

    response.fold(
      (errMessage) => emit(GetMyBalanceFail(errMessage)),
      (myBalance) {
        myBalanceData = myBalance.responseData;

        emit(GetMyBalanceSuccess());
      },
    );
  }

  logOut() async {
    emit(LogOutLoading());
    await getIt.get<CashHelperSharedPreferences>().clearData().then((value) {
      emit(LogOutSuccess());
    }).catchError((value) {
      emit(LogOutFail(value.toString()));
      if (kDebugMode) {
        print(value);
      }
    });
  }

  GivenUsersResponseModel? givenUsersResponseModel;
  List<GivenUser> usersGivenPoints = [];

  Future<void> getGivenUserPoints() async {
    emit(GetUserGivenPointsLoading());
    final response = await settingsRepo.getGivenUserPoints();

    response.fold(
      (errMessage) => emit(GetUserGivenPointsFail(errMessage)),
      (usersGiven) {
        givenUsersResponseModel = usersGiven;
        usersGivenPoints = usersGiven.responseData.givenUsers;

        emit(GetUserGivenPointsSuccess());
      },
    );
  }

  List<Map> updateCount = [];

  Future<void> updateGiverCountPoints({
    required num lowyerId,
  }) async {
    emit(UpdateGiverPointsLoading());

    final response = await settingsRepo.updateCountPonts(
      lowyerId: lowyerId,
      data: updateCount,
    );
    response.fold(
      (errMessage) {
        emit(UpdateGiverPointsFail(errMessage));
      },
      (response) {
        emit(UpdateGiverPointsSuccess(response));
      },
    );
  }
}
