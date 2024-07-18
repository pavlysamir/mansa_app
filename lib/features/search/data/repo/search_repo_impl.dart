import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/features/authentication/data/models/grades_registration_model.dart';
import 'package:mansa_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiConsumer api;
  SearchRepoImpl({required this.api});

  @override
  Future<Either<String, List<GradesRegistrationModel>>>
      getAllGradesRegistration() async {
    try {
      final response = await api.get(
        EndPoint.getAllGradesRegistration,
      );
      List<GradesRegistrationModel> allGradesRegistration = [];
      for (var element in response) {
        allGradesRegistration.add(GradesRegistrationModel.fromJson(element));
      }

      return Right(allGradesRegistration);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
