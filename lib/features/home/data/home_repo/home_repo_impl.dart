import 'package:dartz/dartz.dart';
import 'package:mansa_app/core/api/api_consumer.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/errors/exceptions.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;
  HomeRepoImpl({required this.api});

  @override
  Future<Either<String, ApiResponse>> getAllUsers({int pageNumber = 1}) async {
    try {
      final response = await api.post(EndPoint.getAllUsers, queryParameters: {
        ApiKey.pageNum: pageNumber,
        ApiKey.pageSize: 10,
      });

      return Right(ApiResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, UserSortedModel>> getCurrentUserSorted() async {
    try {
      final response =
          await api.post(EndPoint.getCurrentUserSorted, queryParameters: {
        'userId': getIt.get<CashHelperSharedPreferences>().getData(
              key: ApiKey.id,
            )
      });

      return Right(UserSortedModel.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
