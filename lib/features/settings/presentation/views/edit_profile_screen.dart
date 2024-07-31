import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_large.dart';
import 'package:mansa_app/core/utils/widgets/custom_drop_down_menu.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
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

  @override
  void initState() {
    super.initState();
    settingsCubit = SettingsCubit.get(context);
    settingsCubit!.getProfileSettingData();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    settingsCubit!.clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.editProfile,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            //  state is GetSearchedUsersLoading
            //     ?
            //  const Center(
            //     child: CircularProgressIndicator(
            //     color: kPrimaryKey,
            //   ))
            // :
            CustomButtonLarge(
          text: AppLocalizations.of(context)!.save,
          function: () {
            //  SettingsCubit.get(context)!.getSearchedUsers(1);
          },
          textColor: Colors.white,
        ),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
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
                                      CustomDropDownMenu(
                                        list: SettingsCubit.get(context)!
                                            .namesOfGrades,
                                        value:
                                            SettingsCubit.get(context)!.grade,
                                        onChanged: (String? newValue) {
                                          SettingsCubit.get(context)!
                                              .selectGrade(newValue!);
                                        },
                                      )
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
                            AppLocalizations.of(context)!.mainAssociation,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomDropDownMenu(
                            list: SettingsCubit.get(context)!
                                .namesOfBarAssociations,
                            value: SettingsCubit.get(context)!.association,
                            onChanged: (String? newValue) {
                              SettingsCubit.get(context)!
                                  .selectAssociation(newValue!);
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!.anotherAssociation,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomDropDownMenu(
                            list: SettingsCubit.get(context)!
                                .namesOfSpecializationField,
                            value:
                                SettingsCubit.get(context)!.specializationField,
                            onChanged: (String? newValue) {
                              SettingsCubit.get(context)!
                                  .selectSpecializationField(newValue!);
                            },
                          ),
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
                          //       .namesOfGrantingUniversity,
                          //   value:
                          //       SettingsCubit.get(context)!.grantingUniversity,
                          //   onChanged: (String? newValue) {
                          //     SettingsCubit.get(context)!
                          //         .selectGrantingUniversity(newValue!);
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
                          CustomDropDownMenu(
                            list:
                                SettingsCubit.get(context)!.namesOfGovernments,
                            value: SettingsCubit.get(context)!.government,
                            onChanged: (String? newValue) {
                              SettingsCubit.get(context)!
                                  .selectGovernment(newValue!);
                            },
                          ),
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
                          CustomDropDownMenu(
                            list: SettingsCubit.get(context)!.namesOfDistricts,
                            value: SettingsCubit.get(context)!.district,
                            onChanged: (String? newValue) {
                              SettingsCubit.get(context)!
                                  .selectDistrict(newValue!);
                            },
                          ),
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
                                      .clickAvalabilityToWork(
                                          SettingsCubit.get(context)!
                                              .idsOfAvalabilityToWork[index]);
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
                                .putYourVisionController,
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
