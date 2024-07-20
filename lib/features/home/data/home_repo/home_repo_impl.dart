import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;
  HomeRepoImpl({required this.api});

  @override
  Future<Either<String, List<User>>> getAllUsers({int pageNumber = 1}) {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<String, UserSortedModel>> getCurrentUserSorted() async {
    try {
      final response = await api.post(
        EndPoint.getCurrentUserSorted,
      );

      return Right(UserSortedModel.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  // @override
  // Future<Either<String, List<GradesRegistrationModel>>>
  //     getAllGradesRegistration() async {
  //   try {
  //     final response = await api.get(
  //       EndPoint.getAllGradesRegistration,
  //     );
  //     List<GradesRegistrationModel> allGradesRegistration = [];
  //     for (var element in response) {
  //       allGradesRegistration.add(GradesRegistrationModel.fromJson(element));
  //     }

  //     return Right(allGradesRegistration);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage!);
  //   }
  // }
}
