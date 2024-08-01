import 'package:dartz/dartz.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileResponse>> getProfileData();
}
