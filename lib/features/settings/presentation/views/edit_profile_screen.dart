import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/core/utils/widgets/pop_up_dialog.dart';
import 'package:mansa_app/core/utils/widgets/selcted_item_listView_drop_down.dart';
import 'package:mansa_app/core/utils/widgets/selected_drop_down_manager.dart';
import 'package:mansa_app/features/search/presentation/widgets/custom_buttom_filter.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';
import 'package:mansa_app/features/settings/presentation/widgets/circular_profile_img.dart';
import 'package:mansa_app/features/settings/presentation/widgets/custom_description_post_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  SettingsCubit? settingsCubit;
  final SelectedDropDownManager manager = SelectedDropDownManager();
  final SelectedMultipleDropDownManager managerMultiple =
      SelectedMultipleDropDownManager();

  @override
  void initState() {
    super.initState();
    settingsCubit = SettingsCubit.get(context);
    settingsCubit!.getProfileSettingData();
    // Initially show all items
    settingsCubit!.filteredDistrictItems = settingsCubit!.namesOfDistricts;
    // Add listener for search input changes
    settingsCubit!.searchController.addListener(() {
      settingsCubit!.filterSearchResults(settingsCubit!.searchController.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    settingsCubit!.clearData();
    settingsCubit!.file == null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.editProfile,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      bottomNavigationBar: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: state is UpdateLaawyerDataLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: kPrimaryKey,
                  ))
                : CustomButtonLarge(
                    text: AppLocalizations.of(context)!.save,
                    function: () {
                      SettingsCubit.get(context)!.checkValidateEditeProfile();
                    },
                    textColor: Colors.white,
                  ),
          );
        },
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is CheckFauild) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('الرجاء ادخال كافة البيانات'),
              ),
            );
          } else if (state is UpdateLaawyerDataSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('تم تحديث البيانات بنجاح'),
              ),
            );
          } else if (state is UpdateLaawyerDatatsFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('الرجاء المحاوله مره اخرى'),
              ),
            );
          }
        },
        builder: (context, state) {
          return state is TriggerFunctionLoading ||
                  state is GetProfileSettingLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: SettingsCubit.get(context)!.editProfileKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.dg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          const CircularProfileImage(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.nameWithout,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              controller:
                                  SettingsCubit.get(context)!.nameController,
                              // validationMassage: conditionOfValidationName,
                              hintText:
                                  AppLocalizations.of(context)!.tripleName,
                              textInputType: TextInputType.text),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.phoneNumberWithout,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              controller:
                                  SettingsCubit.get(context)!.phoneController,
                              // validationMassage: conditionOfValidationPhone,
                              hintText: '01000000000',
                              textInputType: TextInputType.phone),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.email,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              controller:
                                  SettingsCubit.get(context)!.emailController,
                              // validationMassage: conditionOfValidationPhone,
                              hintText: 'example@gmail.com',
                              textInputType: TextInputType.emailAddress),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.kedDegree,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),

                                      GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  PopUpDialogDropDown(
                                                context: context,
                                                function: () {
                                                  Navigator.pop(context);
                                                },
                                                widget: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 200.h,
                                                      child: ListView.builder(
                                                          itemCount:
                                                              SettingsCubit.get(
                                                                      context)!
                                                                  .namesOfGrades
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return SelectedDropDownItem(
                                                              selectedIndex:
                                                                  SettingsCubit.get(
                                                                          context)!
                                                                      .gradeId,
                                                              manager: manager,
                                                              functionSelected:
                                                                  () {
                                                                SettingsCubit.get(
                                                                        context)!
                                                                    .selectGrade(
                                                                        SettingsCubit.get(context)!
                                                                            .namesOfGrades[index]);
                                                              },
                                                              index: index,
                                                              name: SettingsCubit
                                                                      .get(
                                                                          context)!
                                                                  .namesOfGrades[index],
                                                            );
                                                          }),
                                                    ),
                                                    state
                                                            is UpdateGiverPointsLoading
                                                        ? const Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              backgroundColor:
                                                                  kPrimaryKey,
                                                            ),
                                                          )
                                                        : CustomButtonLarge(
                                                            text: AppLocalizations
                                                                    .of(
                                                                        context)!
                                                                .save,
                                                            textColor:
                                                                Colors.white,
                                                            function: () {
                                                              Navigator.pop(
                                                                  context);
                                                            })
                                                  ],
                                                ),
                                                function2: () {},
                                              ),
                                            );
                                            // PopUpDialogDropDown
                                          },
                                          child: Container(
                                              width: double.infinity,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        SettingsCubit.get(
                                                                    context)!
                                                                .grade ??
                                                            'اختر درجة القيد ',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      const Icon(
                                                          Icons.arrow_drop_down)
                                                    ],
                                                  ),
                                                ),
                                              )))
                                      // CustomDropDownMenu(
                                      //   list: SettingsCubit.get(context)!
                                      //       .namesOfGrades,
                                      //   value:
                                      //       SettingsCubit.get(context)!.grade,
                                      //   onChanged: (String? newValue) {
                                      //     SettingsCubit.get(context)!
                                      //         .selectGrade(newValue!);
                                      //   },
                                      // )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.kedNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      CustomFormField(
                                          textInputType: TextInputType.text,
                                          hintText: '000000000',
                                          controller:
                                              SettingsCubit.get(context)!
                                                  .kedNumberController,
                                          validationMassage: (value) {
                                            if (value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)!
                                                  .kedNumber;
                                            }
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.nkata,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          // CustomDropDownMenu(
                          //   list: SettingsCubit.get(context)!
                          //       .namesOfBarAssociations,
                          //   value: SettingsCubit.get(context)!.association,
                          //   onChanged: (String? newValue) {
                          //     SettingsCubit.get(context)!
                          //         .selectAssociation(newValue!);
                          //   },
                          // ),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpDialogDropDown(
                                    context: context,
                                    function: () {
                                      Navigator.pop(context);
                                    },
                                    widget: Column(
                                      children: [
                                        SizedBox(
                                          height: 200.h,
                                          child: ListView.builder(
                                              itemCount:
                                                  SettingsCubit.get(context)!
                                                      .namesOfBarAssociations
                                                      .length,
                                              itemBuilder: (context, index) {
                                                return SelectedDropDownItem(
                                                  selectedIndex:
                                                      SettingsCubit.get(
                                                              context)!
                                                          .associationId,
                                                  manager: manager,
                                                  functionSelected: () {
                                                    SettingsCubit.get(context)!
                                                        .selectAssociation(
                                                            SettingsCubit.get(
                                                                        context)!
                                                                    .namesOfBarAssociations[
                                                                index]);
                                                  },
                                                  index: index,
                                                  name: SettingsCubit.get(
                                                              context)!
                                                          .namesOfBarAssociations[
                                                      index],
                                                );
                                              }),
                                        ),
                                        state is UpdateGiverPointsLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: kPrimaryKey,
                                                ),
                                              )
                                            : CustomButtonLarge(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .save,
                                                textColor: Colors.white,
                                                function: () {
                                                  Navigator.pop(context);
                                                })
                                      ],
                                    ),
                                    function2: () {},
                                  ),
                                );
                                // PopUpDialogDropDown
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            SettingsCubit.get(context)!
                                                    .association ??
                                                'اختر التخصص الاساسي',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ))),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.mainAssociation,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpDialogDropDown(
                                    context: context,
                                    function: () {
                                      Navigator.pop(context);
                                    },
                                    widget: Column(
                                      children: [
                                        SizedBox(
                                          height: 200.h,
                                          child: ListView.builder(
                                              itemCount: SettingsCubit.get(
                                                      context)!
                                                  .namesOfSpecializationField
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return SelectedMultipleDropDownItem(
                                                  selectedIndices: SettingsCubit
                                                          .get(context)!
                                                      .selectedSpacializationField,
                                                  manager: managerMultiple,
                                                  functionSelected: () {
                                                    SettingsCubit.get(context)!
                                                        .selectSpecializationField(
                                                            SettingsCubit.get(
                                                                        context)!
                                                                    .namesOfSpecializationField[
                                                                index]);
                                                  },
                                                  index: index,
                                                  name: SettingsCubit.get(
                                                              context)!
                                                          .namesOfSpecializationField[
                                                      index],
                                                );
                                              }),
                                        ),
                                        CustomButtonLarge(
                                            text: AppLocalizations.of(context)!
                                                .save,
                                            textColor: Colors.white,
                                            function: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    ),
                                    function2: () {},
                                  ),
                                );
                                // PopUpDialogDropDown
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            SettingsCubit.get(context)!
                                                    .specializationField ??
                                                'اختر التخصص الاخر',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ))),
                          // CustomDropDownMenu(
                          //   list: SettingsCubit.get(context)!
                          //       .namesOfSpecializationField,
                          //   value:
                          //       SettingsCubit.get(context)!.specializationField,
                          //   onChanged: (String? newValue) {
                          //     SettingsCubit.get(context)!
                          //         .selectSpecializationField(newValue!);
                          //   },
                          // ),
                          SizedBox(
                            height: 24.h,
                          ),
                          // Text(
                          //   AppLocalizations.of(context)!.nkata,
                          //   style: Theme.of(context).textTheme.displayMedium,
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // CustomDropDownMenu(
                          //   list: SettingsCubit.get(context)!
                          //       .namesOfBarAssociations,
                          //   value: SettingsCubit.get(context)!.association,
                          //   onChanged: (String? newValue) {
                          //     SettingsCubit.get(context)!
                          //         .selectAssociation(newValue!);
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 24.h,
                          // ),
                          Text(
                            AppLocalizations.of(context)!.adress,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomFormField(
                              controller: SettingsCubit.get(context)!
                                  .adressOfficeController,
                              // validationMassage: conditionOfValidationPhone,
                              hintText: 'رقم المكتب - رقم العقار - اسم الشارع',
                              textInputType: TextInputType.text),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.government,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpDialogDropDown(
                                    context: context,
                                    function: () {
                                      Navigator.pop(context);
                                    },
                                    widget: Column(
                                      children: [
                                        SizedBox(
                                          height: 200.h,
                                          child: ListView.builder(
                                              itemCount:
                                                  SettingsCubit.get(context)!
                                                      .namesOfGovernments
                                                      .length,
                                              itemBuilder: (context, index) {
                                                return SelectedDropDownItem(
                                                  selectedIndex:
                                                      SettingsCubit.get(
                                                              context)!
                                                          .governmentId,
                                                  manager: manager,
                                                  functionSelected: () {
                                                    SettingsCubit.get(context)!
                                                        .selectGovernment(
                                                            SettingsCubit.get(
                                                                        context)!
                                                                    .namesOfGovernments[
                                                                index]);
                                                  },
                                                  index: index,
                                                  name: SettingsCubit.get(
                                                              context)!
                                                          .namesOfGovernments[
                                                      index],
                                                );
                                              }),
                                        ),
                                        state is UpdateGiverPointsLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: kPrimaryKey,
                                                ),
                                              )
                                            : CustomButtonLarge(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .save,
                                                textColor: Colors.white,
                                                function: () {
                                                  Navigator.pop(context);
                                                })
                                      ],
                                    ),
                                    function2: () {},
                                  ),
                                );
                                // PopUpDialogDropDown
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            SettingsCubit.get(context)!
                                                    .government ??
                                                'اختر درجة القيد ',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ))),

                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.district,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      PopUpDialogDropDown(
                                    context: context,
                                    function: () {
                                      Navigator.pop(context);
                                    },
                                    widget: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextField(
                                            controller:
                                                settingsCubit!.searchController,
                                            decoration: const InputDecoration(
                                              labelText: 'Search',
                                              border: OutlineInputBorder(),
                                              prefixIcon: Icon(Icons.search),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200.h,
                                          child: ListView.builder(
                                              itemCount:
                                                  SettingsCubit.get(context)!
                                                      .filteredDistrictItems
                                                      .length,
                                              itemBuilder: (context, index) {
                                                return SelectedDropDownItem(
                                                  manager: manager,
                                                  functionSelected: () {
                                                    SettingsCubit.get(context)!
                                                        .selectDistrict(
                                                            SettingsCubit.get(
                                                                        context)!
                                                                    .filteredDistrictItems[
                                                                index]);
                                                  },
                                                  index: index,
                                                  name: SettingsCubit.get(
                                                              context)!
                                                          .filteredDistrictItems[
                                                      index],
                                                  selectedIndex:
                                                      SettingsCubit.get(
                                                              context)!
                                                          .districtId,
                                                );
                                              }),
                                        ),
                                        state is UpdateGiverPointsLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: kPrimaryKey,
                                                ),
                                              )
                                            : CustomButtonLarge(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .save,
                                                textColor: Colors.white,
                                                function: () {
                                                  Navigator.pop(context);
                                                })
                                      ],
                                    ),
                                    function2: () {},
                                  ),
                                );
                                // PopUpDialogDropDown
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            SettingsCubit.get(context)!
                                                    .district ??
                                                'اختر درجة القيد ',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ))),

                          SizedBox(
                            height: 24.h,
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
                                isSelected: SettingsCubit.get(context)!
                                        .mapAvalabilityToWork[
                                    SettingsCubit.get(context)!
                                        .idsOfAvalabilityToWork[index]]!,
                                id: SettingsCubit.get(context)!
                                    .idsOfAvalabilityToWork[index],
                                function: () {
                                  SettingsCubit.get(context)!
                                                  .mapAvalabilityToWork[
                                              SettingsCubit.get(context)!
                                                      .idsOfAvalabilityToWork[
                                                  index]] !=
                                          true
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              PopUpDialogDropDown(
                                            context: context,
                                            function: () {
                                              Navigator.pop(context);
                                            },
                                            widget: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ' ضع شرح للحالة',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium,
                                                ),
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                CustomDescriptionPostField(
                                                  controller: SettingsCubit.get(
                                                          context)!
                                                      .controllers[index],
                                                  hintText: 'بحد اقصى 20 كلمه ',
                                                  textInputType:
                                                      TextInputType.text,
                                                ),
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                state
                                                        is UpdateGiverPointsLoading
                                                    ? const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          backgroundColor:
                                                              kPrimaryKey,
                                                        ),
                                                      )
                                                    : CustomButtonLarge(
                                                        text:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .save,
                                                        textColor: Colors.white,
                                                        function: () {
                                                          SettingsCubit.get(
                                                                  context)!
                                                              .clickAvalabilityToWork(
                                                                  SettingsCubit.get(
                                                                          context)!
                                                                      .idsOfAvalabilityToWork[index]);
                                                          Navigator.pop(
                                                              context);
                                                        })
                                              ],
                                            ),
                                            function2: () {},
                                          ),
                                        )
                                      : SettingsCubit.get(context)!
                                          .clickAvalabilityToWork(SettingsCubit
                                                  .get(context)!
                                              .idsOfAvalabilityToWork[index]);
                                  // SettingsCubit.get(context)!
                                  //     .clickAvalabilityToWork(
                                  //         SettingsCubit.get(context)!
                                  //             .idsOfAvalabilityToWork[index]);
                                },
                                text: SettingsCubit.get(context)!
                                    .namesOfAvalabilityToWork[index],
                              );
                            },
                            itemCount: SettingsCubit.get(context)!
                                .namesOfAvalabilityToWork
                                .length,
                          ),
                          Text(
                            AppLocalizations.of(context)!.putYourDescription,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          CustomDescriptionPostField(
                            controller: SettingsCubit.get(context)!
                                .putYourVisionController!,
                            hintText: 'قم بكتابة رؤيتك في القانون ',
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
