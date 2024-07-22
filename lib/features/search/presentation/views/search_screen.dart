import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_drop_down_menu.dart';
import 'package:mansa_app/features/search/data/repo/search_repo_impl.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:mansa_app/features/search/presentation/widgets/Custom_Search_Bar.dart';
import 'package:mansa_app/features/search/presentation/widgets/custom_buttom_filter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(getIt.get<SearchRepoImpl>())..triggerGetFunctions(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  AppLocalizations.of(context)!.search,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButtonLarge(
                  text: AppLocalizations.of(context)!.search,
                  function: () {
                    SearchCubit.get(context)!.getSearchedUsers(1);
                  },
                  textColor: Colors.white,
                ),
              ),
              body: state is TriggerFunctionLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kPrimaryKey,
                    ))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              child: CustomSearchBar(context: context),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!.kedDegree,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 16),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomButtomFilterSearch(
                                  isSelected: SearchCubit.get(context)!
                                          .mapGradRegistration[
                                      SearchCubit.get(context)!
                                          .idsOfGrades[index]]!,
                                  id: SearchCubit.get(context)!
                                      .idsOfGrades[index],
                                  function: () {
                                    SearchCubit.get(context)!.click(
                                        SearchCubit.get(context)!
                                            .idsOfGrades[index]);
                                  },
                                  text: SearchCubit.get(context)!
                                      .namesOfGrades[index],
                                );
                              },
                              itemCount: SearchCubit.get(context)!
                                  .namesOfGrades
                                  .length,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              AppLocalizations.of(context)!.state,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 16),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.h,
                              ),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CustomButtomFilterSearch(
                                  isSelected: SearchCubit.get(context)!
                                          .mapAvalabilityToWork[
                                      SearchCubit.get(context)!
                                          .idsOfAvalabilityToWork[index]]!,
                                  id: SearchCubit.get(context)!
                                      .idsOfAvalabilityToWork[index],
                                  function: () {
                                    SearchCubit.get(context)!
                                        .clickAvalabilityToWork(
                                            SearchCubit.get(context)!
                                                .idsOfAvalabilityToWork[index]);
                                  },
                                  text: SearchCubit.get(context)!
                                      .namesOfAvalabilityToWork[index],
                                );
                              },
                              itemCount: SearchCubit.get(context)!
                                  .namesOfAvalabilityToWork
                                  .length,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.government,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: CustomDropDownMenu(
                                    list: SearchCubit.get(context)!
                                        .namesOfGovernments,
                                    value: SearchCubit.get(context)!.government,
                                    onChanged: (String? newValue) {
                                      SearchCubit.get(context)!
                                          .selectGovernment(newValue!);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.district,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: CustomDropDownMenu(
                                    list: SearchCubit.get(context)!
                                        .namesOfDistricts,
                                    value: SearchCubit.get(context)!.district,
                                    onChanged: (String? newValue) {
                                      SearchCubit.get(context)!
                                          .selectDistrict(newValue!);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
        },
      ),
    );
  }
}
