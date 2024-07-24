import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
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
    emit(GetAllSubjectsRegistrationLoading());
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
        emit(GetAllGradesRegistrationSuccess());
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

  Future<void> triggerGetFunctions() async {
    emit(TriggerFunctionLoading());
    await getAllGradesRegistration();
    await getAllAvalabilityToWork();
    await getAllDistricts();
    await getAllGovernmentsk();

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
}
