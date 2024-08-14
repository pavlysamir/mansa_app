import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/app_router.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_drop_down_menu.dart';
import 'package:mansa_app/core/utils/widgets/custom_go_navigator.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:mansa_app/features/search/presentation/widgets/Custom_Search_Bar.dart';
import 'package:mansa_app/features/search/presentation/widgets/custom_buttom_filter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    _searchCubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  void dispose() {
    // No need to manually dispose of the searchController here.
    // _searchCubit.searchController.dispose(); // Remove this line
    _searchCubit.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) async {
        if (state is GetSearchedUsersSuccess) {
          customJustGoNavigate(
              context: context, path: AppRouter.kResultSearchScreen);
          await _searchCubit.clearData();
        } else if (state is GetSearchedUsersFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
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
            child: state is GetSearchedUsersLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryKey,
                    ),
                  )
                : CustomButtonLarge(
                    text: AppLocalizations.of(context)!.search,
                    function: () {
                      _searchCubit.getSearchedUsers(1);
                    },
                    textColor: Colors.white,
                  ),
          ),
          body: state is TriggerFunctionLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 50.h,
                          child: const CustomSearchBar(),
                        ),
                        SizedBox(height: 14.h),
                        const Divider(),
                        SizedBox(height: 14.h),
                        Text(
                          AppLocalizations.of(context)!.kedDegree,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 16),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomButtomFilterSearch(
                              isSelected: _searchCubit.mapGradRegistration[
                                  _searchCubit.idsOfGrades[index]]!,
                              id: _searchCubit.idsOfGrades[index],
                              function: () {
                                _searchCubit
                                    .click(_searchCubit.idsOfGrades[index]);
                              },
                              text: _searchCubit.namesOfGrades[index],
                            );
                          },
                          itemCount: _searchCubit.namesOfGrades.length,
                        ),
                        SizedBox(height: 14.h),
                        const Divider(),
                        SizedBox(height: 14.h),
                        Text(
                          AppLocalizations.of(context)!.state,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 16),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomButtomFilterSearch(
                              isSelected: _searchCubit.mapAvalabilityToWork[
                                  _searchCubit.idsOfAvalabilityToWork[index]]!,
                              id: _searchCubit.idsOfAvalabilityToWork[index],
                              function: () {
                                _searchCubit.clickAvalabilityToWork(
                                    _searchCubit.idsOfAvalabilityToWork[index]);
                              },
                              text:
                                  _searchCubit.namesOfAvalabilityToWork[index],
                            );
                          },
                          itemCount:
                              _searchCubit.namesOfAvalabilityToWork.length,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.government,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(height: 14.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: CustomDropDownMenu(
                                list: _searchCubit.namesOfGovernments,
                                value: _searchCubit.government,
                                onChanged: (String? newValue) {
                                  _searchCubit.selectGovernment(newValue!);
                                },
                              ),
                            ),
                            SizedBox(height: 14.h),
                            Text(
                              AppLocalizations.of(context)!.district,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(height: 14.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: CustomDropDownMenu(
                                list: _searchCubit.namesOfDistricts,
                                value: _searchCubit.district,
                                onChanged: (String? newValue) {
                                  _searchCubit.selectDistrict(newValue!);
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
