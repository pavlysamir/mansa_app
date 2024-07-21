import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mansa_app/core/api/dio_consumer.dart';
import 'package:mansa_app/features/authentication/data/auth_repo/auth_repo_impl.dart';
import 'package:mansa_app/features/home/data/home_repo/home_repo_impl.dart';
import 'package:mansa_app/features/search/data/repo/search_repo_impl.dart';

import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());

  getIt.registerSingleton<DioConsumer>(DioConsumer(
    dio: Dio(),
  ));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));
  // getIt.registerSingleton<ProfileRepository>(ProfileRepository(
  //   api: getIt.get<DioConsumer>(),
  // ));
}
