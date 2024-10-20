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
// Import the two conflicting libraries with different aliases
import 'package:mansa_app/features/settings/data/models/edit_lawyer_data.dart'
    as edit_lawyer;

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

  TextEditingController? putYourVisionController = TextEditingController();

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
        allGradesRegistrationConst = allGrades;
        // saveListInSharedPreferences(
        //     key: ApiKey.allgradesRegisters, list: allGradesRegistration);
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
  int? gradeId;

  void selectGrade(String grade) {
    this.grade = grade;
    for (var element in allGradesRegistration) {
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
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<Map<String, dynamic>> avaialabaleToWorkControllers = [];
  void clickAvalabilityToWork(int id) {
    mapAvalabilityToWork[id] = !mapAvalabilityToWork[id]!;

    addClickAvailabilityToWorkToList(id);
    emit(SearchClick());
  }

  void addClickAvailabilityToWorkToList(int id) {
    if (mapAvalabilityToWork[id] == true) {
      availabilityToWordIds.add(id);
      avaialabaleToWorkControllers.add(
          {"availabilityWorkId": id, "description": controllers[id - 1].text});

      print(availabilityToWordIds.toString());
      print(controllers[id - 1].text);
    } else {
      availabilityToWordIds.remove(id);
      avaialabaleToWorkControllers.removeAt(id - 1);

      //Scontrollers[id].text = "";
      print(availabilityToWordIds.toString());
      print(avaialabaleToWorkControllers.length);
    }
  }

  Map<int, bool> mapAvalabilityToWork = {};

  List<AvailibalityWorkModel> allAvalabilityToWork = [];
  List<String> namesOfAvalabilityToWork = [];
  List<int> idsOfAvalabilityToWork = [];
  int? avalabilityToWorkId;

  late String avalabilityToWorkField;

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
          avalabilityToWorkId = idsOfAvalabilityToWork.first;
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
        allGovernmentConst = allGov;
        print('sssssssssssssss${allGovernmentConst.length}');
        for (var element in allGovernments) {
          namesOfGovernments.add(element.nameAr ?? '');
          idsOfGovernments.add(element.id);
        }
        // print('sssssssssssssss$namesOfGovernments');
        government = 'اختر المحافظة';
        // governmentId = allGovernments.first.id;
        // emit(GetAllGovernmentsSuccess());
      },
    );
  }

  TextEditingController searchController = TextEditingController();

  List<String> filteredDistrictItems = [];

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
        allDistrictConst = allDis;

        for (var element in allDistricts) {
          namesOfDistricts.add(element.nameAr ?? '');
          idsOfDistricts.add(element.id);
        }
        district = 'اختر المدينه';
        filteredDistrictItems = namesOfDistricts;
        // districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  // Function to filter the search results based on input
  void filterSearchResults(String query) {
    List<String> searchResults = [];
    if (query.isEmpty) {
      searchResults = namesOfDistricts;
    } else {
      searchResults = namesOfDistricts
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    filteredDistrictItems = searchResults;

    emit(SearchInDistricSuccessfully());
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
        allBarAssociationsConst = allAssoci;
        for (var element in allBarAssociations) {
          namesOfBarAssociations.add(element.nameAr ?? '');
          idsOfBarAssociations.add(element.id);
        }
        association = namesOfBarAssociations.first;

        // districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  String? association;
  int? associationId;

  void selectAssociation(String association) {
    this.association = association;
    for (var element in allBarAssociations) {
      if (element.nameAr == association) {
        associationId = element.id;
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
        allGeneralLawConst = allBachelors;
        for (var element in allGeneralLawBachelor) {
          namesOfGeneralLawBachelor.add(element.nameAr ?? '');
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
          namesOfGrantingUniversity.add(element.nameAr ?? '');
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
          namesOfPostgraduateStudy.add(element.nameAr ?? '');
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
          namesOfSpecializationField.add(element.nameAr ?? '');
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

  List<int> selectedSpacializationField = [];
  List<bool> isPrimary = [];
  //Method to select SpecializationField
  void selectSpecializationField(String specializationField) {
    this.specializationField = specializationField;
    for (var element in allSpecializationField) {
      if (element.nameAr == specializationField) {
        specializationFieldId = element.id;
        if (selectedSpacializationField.contains(element.id)) {
          selectedSpacializationField.remove(element.id);
          isPrimary.isNotEmpty ? isPrimary[0] = true : null;
        } else if (selectedSpacializationField.length < 4) {
          selectedSpacializationField.add(element.id);
          isPrimary.isEmpty ? isPrimary.add(true) : isPrimary.add(false);
        } else {
          null;
        }
      }
    }
    if (kDebugMode) {
      print('$selectedSpacializationField');
    }
    emit(SelectedSpecializationField());
  }

  Future<void> triggerGetFunctions() async {
    emit(TriggerFunctionLoading());
    await getAllGradesRegistration();
    await getAllAvalabilityToWork();
    await getAllDistricts();
    await getAllGovernmentsk();
    // hnrg3 n3mlooo
    await getAllBarAssociations();
    // await getAllGeneralLawBachelor();
    await getAllGrantingUniversity();
    // await getAllPostgraduateStudy();
    await getAllSpecializationField();

    emit(TriggerFunctionSuccess());
  }

  Future<void> clearData() async {
    nameController.clear();
    availabilityToWordIds.clear();
    government = "اختر المحافظة";
    district = "اختر المدينه";
    grade = namesOfGrades.first;
    gradeId = allGradesRegistration.first.id;
    districtId = allDistricts.first.id;
    governmentId = allGovernments.first.id;
    emailController.clear();
    phoneController.clear();
    putYourVisionController!.clear();
    adressOfficeController.clear();
    file = null;

    mapAvalabilityToWork.forEach(((key, value) {
      mapAvalabilityToWork[key] = false;
    }));
    avaialabaleToWorkControllers.clear();

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

  Future<void> initializeLanguage() async {
    // Retrieve the saved language preference when the app starts.
    final bool? savedIsEnglish =
        getIt.get<CashHelperSharedPreferences>().getData(
              key: 'isEnglishh',
            );

    final bool? savedIsDark = getIt.get<CashHelperSharedPreferences>().getData(
          key: 'isDark',
        );

    // Update the isEnglish variable.
    if (savedIsEnglish != null) {
      isEnglish = savedIsEnglish;
    } else if (savedIsDark != null) {
      isEnglish = savedIsDark;
    }
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
    print(selectedSpacializationField);
    availabilityToWordIds.clear();
    avaialabaleToWorkControllers.clear();
    // selectedSpacializationField.clear();
    // isPrimary.clear();

    final response = await settingsRepo.getProfileSettingsData();

    response.fold(
      (errMessage) => emit(GetProfileSettingFail(errMessage)),
      (profileSett) {
        profileSetingsData = profileSett;
        nameController.text = profileSetingsData!.responseData!.name;
        emailController.text = profileSetingsData!.responseData!.email ?? '';
        phoneController.text =
            profileSetingsData!.responseData!.mobileNo.startsWith('+2')
                ? profileSetingsData!.responseData!.mobileNo.substring(2)
                : profileSetingsData!.responseData!.mobileNo;
        kedNumberController.text =
            profileSetingsData!.responseData!.registrationNumber ?? '';
        putYourVisionController!.text =
            profileSetingsData!.responseData!.description ?? '';
        adressOfficeController.text =
            profileSetingsData!.responseData!.address ?? '';
        for (var element
            in profileSetingsData!.responseData!.specializationFields) {
          selectedSpacializationField.add(element.specializationFieldId);
          isPrimary.add(element.isPrimary);
          specializationFieldId = element.specializationFieldId;
          specializationField = element.name;
        }

        for (var element in profileSetingsData!.responseData!.availableWorks) {
          controllers.add(TextEditingController(text: element.description));
          mapAvalabilityToWork.addAll({element.availabilityWorkId: true});
          avaialabaleToWorkControllers.add({
            "availabilityWorkId": element.availabilityWorkId,
            "description": element.description,
          });

          availabilityToWordIds.add(element.availabilityWorkId);

          // av = element.name;
        }
        if (kDebugMode) {
          print('dddddddddddddddd ${availabilityToWordIds}');
        }
        districtId = profileSetingsData!.responseData!.districtId;
        governmentId = profileSetingsData!.responseData!.governorateId;
        associationId = profileSetingsData!.responseData!.barAssociationsId;

        gradeId = profileSetingsData!.responseData!.registrationGradeId;
        generalLawBachelorId =
            profileSetingsData!.responseData!.generalLawBachelorId;
        profileSetingsData!.responseData!.picture != null
            ? getIt.get<CashHelperSharedPreferences>().saveData(
                key: ApiKey.profilePic,
                value: profileSetingsData!.responseData!.picture!.url)
            : null;

        getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.userName,
            value: profileSetingsData!.responseData!.name);

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
    required bool isRedeem,
  }) async {
    emit(UpdateGiverPointsLoading());

    final response = await settingsRepo.updateCountPonts(
      lowyerId: lowyerId,
      isRedeem: isRedeem,
      data: updateCount,
    );
    response.fold(
      (errMessage) {
        emit(UpdateGiverPointsFail(errMessage));
      },
      (response) {
        emit(UpdateGiverPointsSuccess(response));
        updateCount = [];
      },
    );
  }

  Future<void> updateLawyerData() async {
    emit(UpdateLaawyerDataLoading());

    // Ensure specializationFieldId is not null before creating SpecializationField objects
    List<Map<String, dynamic>> specializationFields = [];
    if (selectedSpacializationField != []) {
      for (int i = 0; i < selectedSpacializationField.length; i++) {
        specializationFields.add({
          "specializationFieldId": selectedSpacializationField[i],
          "isPrimary": isPrimary[i]
        });
      }
    } else {
      // Handle the case where specializationFieldId is null, if necessary
      print('Warning: specializationFieldId is null');
    }

    // List<Map<String, dynamic>> availableWorks = [];
    // if (availabilityToWordIds != []) {
    //   for (int i = 0; i < availabilityToWordIds.length; i++) {
    //     print(controllers[i].text);
    //     availableWorks.add({
    //       "availabilityWorkId": availabilityToWordIds[i],
    //       "description": controllers[i].text
    //     });
    //   }
    //   // availableWorks = availabilityToWordIds.map((i) {
    //   //   return {"availabilityWorkId": i, "description": controllers[i].text};
    //   // }).toList();
    // }

    final response = await settingsRepo.updateProfileSettings(
        //  lawyerData: lawyerData,
        data: {
          "name": nameController.text,
          "mobileNo": '+2${phoneController.text}',
          "email": emailController.text,
          "registrationGradeId": gradeId ?? 0,
          //"generalLawBachelorId": generalLawBachelorId ?? 0,
          "barAssociationsId": associationId,
          "governorateId": governmentId,
          "districtId": districtId,
          "registrationNumber": kedNumberController.text,
          "address": adressOfficeController.text,
          "description": putYourVisionController!.text,
          "specializationFields": specializationFields,
          "availableWorks": avaialabaleToWorkControllers,
          // "picture": {"file": file == null ? '' : file!.path, "fileTypeId": 1}
        });
    response.fold(
      (errMessage) {
        emit(UpdateLaawyerDatatsFail(errMessage));
      },
      (response) {
        emit(UpdateLaawyerDataSuccess());
        // file == null ? null : addFile();
      },
    );
  }

  Future<void> addFile() async {
    emit(AddFileLoading());
    final response = await settingsRepo.addFile(
      userId: getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.id)
          .toString(),
      dataType: ['1'],
      file: [file!],
    );

    response.fold(
      (errMessage) => emit(AddFileFaluir(errMessage)),
      (message) {
        emit(AddFileSuccess());
      },
    );
  }

  Future<void> updateFile() async {
    emit(AddFileLoading());
    final response = await settingsRepo.updateFile(
      userId: getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.id)
          .toString(),
      dataType: ['1'],
      file: [file!],
    );

    response.fold(
      (errMessage) => emit(AddFileFaluir(errMessage)),
      (message) {
        emit(AddFileSuccess());
      },
    );
  }

  getFile() async {
    emit(GetFileLoading());
    final response = await settingsRepo.getFile(
      userId: getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
    );

    response.fold(
      (errMessage) => emit(GetFileFaluir(errMessage)),
      (message) {
        emit(GetFileSuccess());
      },
    );
  }

  void checkValidateEditeProfile() {
    updateLawyerData().then((value) async {
      file == null ? null : await updateFile();
    }).then((value) {
      getProfileSettingData();
    });
    // if (nameController.text.isEmpty ||
    //     emailController.text.isEmpty ||
    //     phoneController.text.isEmpty ||
    //     putYourVisionController.text.isEmpty ||
    //     adressOfficeController.text.isEmpty ||
    //     kedNumberController.text.isEmpty ||
    //     specializationField == 0 ||
    //     availabilityToWordIds.isEmpty ||
    //     governmentId == 0 ||
    //     districtId == 0 ||
    //     gradeId == 0 ||
    //     generalLawBachelorId == 0 ||
    //     associationId == 0) {
    //   emit(CheckFauild());
    // } else {
    //   updateLawyerData().then((value) {
    //     getProfileSettingData();
    //   });
    // }
  }

  bool isLoading = false;

  deleteAccount() async {
    emit(DeleteAccountLoading());
    isLoading = true;

    final response = await settingsRepo.deleteAccount();

    response.fold(
      (errMessage) {
        isLoading = false;
        emit(DeleteAccountFaluir(errMessage));
      },
      (message) async {
        await getIt.get<CashHelperSharedPreferences>().clearData();
        isLoading = false;

        emit(DeleteAccountSuccess(message));
      },
    );
  }
}
