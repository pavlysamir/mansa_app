import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/home/data/models/user_sorted.dart';

abstract class HomeRepo {
  Future<Either<String, UserSortedModel>> getCurrentUserSorted();

  Future<Either<String, List<User>>> getAllUsers({int pageNumber = 1});
}
