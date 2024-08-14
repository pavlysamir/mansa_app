import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/search/data/models/availability_work_model.dart';
import 'package:mansa_app/features/search/data/models/government_data_model.dart';
import 'package:mansa_app/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  final SearchRepo searchRepository;
  static SearchCubit? get(context) => BlocProvider.of(context);
  final TextEditingController searchController = TextEditingController();
  List<int> kedDegreeIds = [];
  void click(int id) {
    mapGradRegistration[id] = !mapGradRegistration[id]!;
    print(mapGradRegistration.toString());
    addClickKedDegreeToList(id);
    emit(SearchClick());
  }

  void addClickKedDegreeToList(int id) {
    if (mapGradRegistration[id] == true) {
      kedDegreeIds.add(id);
      print(kedDegreeIds.toString());
    } else {
      kedDegreeIds.remove(id);
      print(kedDegreeIds.toString());
    }
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
        // government = namesOfGovernments.first;
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
    final response = await searchRepository.getAllDistrict();

    response.fold(
      (errMessage) => emit(GetAllDistrictsFail(errMessage)),
      (allDis) {
        allDistricts = allDis;
        for (var element in allDistricts) {
          namesOfDistricts.add(element.nameAr);
          idsOfDistricts.add(element.id);
        }
        // district = namesOfDistricts.first;
        // districtId = allDistricts.first.id;
        //   emit(GetAllDistrictsSuccess());
      },
    );
  }

  String? government;
  int? governmentId;

  void selectGovernment(String government) {
    if (this.government != government) {
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
    } else {
      this.government = null;
      governmentId = null;
      if (kDebugMode) {
        print('${this.government}  ${governmentId.toString()}');
      }
      emit(SelectedGovernment());
    }
  }

  String? district;
  int? districtId;

  void selectDistrict(String district) {
    if (this.district != district) {
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
    } else {
      districtId = null;
      this.district = null;
      if (kDebugMode) {
        print('${this.district}  ${districtId.toString()}');
      }
      emit(SelectedDistrict());
    }
  }

  Future<void> triggerGetFunctions() async {
    emit(TriggerFunctionLoading());
    await getAllGradesRegistration();
    await getAllAvalabilityToWork();
    await getAllDistricts();
    await getAllGovernmentsk();

    emit(TriggerFunctionSuccess());
  }

  List<User> users = [];
  int? count;
  getSearchedUsers(int pageNumber) async {
    if (pageNumber == 1) {
      users.clear();
    }

    if (pageNumber == 1) {
      emit(GetSearchedUsersLoading());
    } else {
      emit(GetMoreUsersLoading());
    }
    final response = await searchRepository.getASearchedUsers(
        KedDegreeId: kedDegreeIds,
        pageNumber: pageNumber,
        lawyerName: searchController.text,
        availabilityToWordIds: availabilityToWordIds,
        districtId: districtId,
        governorateId: governmentId);
    response.fold(
        (errMessage) => emit(GetSearchedUsersFailure(message: errMessage)),
        (getAllUsers) {
      if (pageNumber == 1) {
        count = getAllUsers.responseData.count;
      }
      if (kDebugMode) {
        print(getAllUsers.responseData.items.length);
      }
      users.addAll(getAllUsers.responseData.items);
      if (pageNumber == 1) {
        emit(GetSearchedUsersSuccess());
      } else {
        emit(GetMoreSearchedUsersSuccess());
      }
    });
  }

  Future<void> clearData() async {
    searchController.clear();
    kedDegreeIds.clear();
    availabilityToWordIds.clear();

    mapGradRegistration.forEach((key, value) {
      mapGradRegistration[key] = false;
    });
    mapAvalabilityToWork.forEach(((key, value) {
      mapAvalabilityToWork[key] = false;
    }));

    emit(ClearData());
  }
}
