import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  final SearchRepo searchRepository;
  static SearchCubit? get(context) => BlocProvider.of(context);

  void click(int id) {
    map[id] = !map[id]!;

    emit(SearchClick());
  }

  Map<int, bool> map = {};

  List<GradesRegistrationModel> allGradesRegistration = [];
  List<String> namesOfGrades = [];
  List<int> idsOfGrades = [];

  Future<void> getAllGradesRegistration() async {
    emit(GetAllSubjectsRegistrationLoading());
    final response = await searchRepository.getAllGradesRegistration();

    response.fold(
      (errMessage) => emit(GetAllGradesRegistrationFail(errMessage)),
      (allGrades) {
        allGradesRegistration = allGrades;
        for (var element in allGradesRegistration) {
          namesOfGrades.add(element.nameAr);
          idsOfGrades.add(element.id);

          map[element.id] = false;
        }

        emit(GetAllGradesRegistrationSuccess());
      },
    );
  }
}
