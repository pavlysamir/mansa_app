import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
import 'package:mansa_app/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  final SearchRepo searchRepository;
  static SearchCubit? get(context) => BlocProvider.of(context);

  void click(int id) {
    mapGradRegistration[id] = !mapGradRegistration[id]!;

    emit(SearchClick());
  }

  Map<int, bool> mapGradRegistration = {};

  List<GradesRegistrationModel> allGradesRegistration = [];
  List<String> namesOfGrades = [];
  List<int> idsOfGrades = [];

  Future<void> getAllGradesRegistration() async {
    // emit(GetAllSubjectsRegistrationLoading());
    final response = await searchRepository.getAllGradesRegistration();

    response.fold(
      (errMessage) => emit(GetAllGradesRegistrationFail(errMessage)),
      (allGrades) {
        allGradesRegistration = allGrades;
        for (var element in allGradesRegistration) {
          namesOfGrades.add(element.nameAr);
          idsOfGrades.add(element.id);

          mapGradRegistration[element.id] = false;
        }

        // emit(GetAllGradesRegistrationSuccess());
      },
    );
  }

  void clickAvalabilityToWork(int id) {
    mapAvalabilityToWork[id] = !mapAvalabilityToWork[id]!;

    emit(SearchClick());
  }

  Map<int, bool> mapAvalabilityToWork = {};

  List<AvailibalityWorkModel> allAvalabilityToWork = [];
  List<String> namesOfAvalabilityToWork = [];
  List<int> idsOfAvalabilityToWork = [];

  Future<void> getAllAvalabilityToWork() async {
    // emit(GetAllAvalabalityOfWorkLoading());
    final response = await searchRepository.getAllAvailabalityWork();

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
    final response = await searchRepository.getAllGovernment();

    response.fold(
      (errMessage) => emit(GetAllGovernmentsFail(errMessage)),
      (allGov) {
        allGovernments = allGov;
        for (var element in allGovernments) {
          namesOfGovernments.add(element.nameAr);
          idsOfGovernments.add(element.id);
        }
        government = namesOfGovernments.first;
        governmentId = allGovernments.first.id;
        // emit(GetAllGovernmentsSuccess());
      },
    );
  }

  List<GovernmentDataModel> allDistricts = [];
  List<String> namesOfDistricts = [];
  List<int> idsOfDistricts = [];

  Future<void> getAllDistricts() async {
    // emit(GetAllDistrictsLoading());
    final response = await searchRepository.getAllDistrict();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allDis) {
        allDistricts = allDis;
        for (var element in allDistricts) {
          namesOfDistricts.add(element.nameAr);
          idsOfDistricts.add(element.id);
        }
        district = namesOfDistricts.first;
        districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  late String government;
  late int governmentId;

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
  late int districtId;

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
}
