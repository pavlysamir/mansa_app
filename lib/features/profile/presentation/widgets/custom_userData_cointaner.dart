import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/features/profile/data/models/profile_data_model.dart';
import 'package:mansa_app/features/profile/presentation/managers/cubit/profile_cubit.dart';
import 'package:mansa_app/features/profile/presentation/widgets/custom_userData_row.dart';

class CustomUserdataCointaner extends StatelessWidget {
  const CustomUserdataCointaner({super.key, required this.myProfileData});
  final ProfileResponse myProfileData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          color: kMoreLightBlue,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                myProfileData.profileData.barAssociationsId == 0
                    ? const SizedBox()
                    : CustomUserdataRow(
                        isNull: myProfileData.profileData.barAssociationsId == 0
                            ? true
                            : false,
                        img: AssetsData.nkaba,
                        text: myProfileData.profileData.barAssociationsId == 0
                            ? 'النقابة'
                            : ProfileCubit.get(context)!.getNkabaName(
                                myProfileData.profileData.barAssociationsId)),
                myProfileData.profileData.generalLawBachelorId == 0
                    ? const SizedBox()
                    : CustomUserdataRow(
                        isNull:
                            myProfileData.profileData.generalLawBachelorId == 0
                                ? true
                                : false,
                        img: AssetsData.mizan,
                        text: myProfileData.profileData.generalLawBachelorId ==
                                0
                            ? 'ليسانس حقوق عام '
                            : ProfileCubit.get(context)!.getBacaloryName(
                                myProfileData.profileData.generalLawBachelorId),
                      ),
                myProfileData.profileData.districtId == 0 ||
                        myProfileData.profileData.governorateId == 0
                    ? const SizedBox()
                    : CustomUserdataRow(
                        isNull: myProfileData.profileData.districtId == 0 ||
                                myProfileData.profileData.governorateId == 0
                            ? true
                            : false,
                        img: AssetsData.address,
                        text: myProfileData.profileData.districtId == 0
                            ? 'العنوان'
                            : '${ProfileCubit.get(context)!.getAddressGovernment(myProfileData.profileData.governorateId)} ,${ProfileCubit.get(context)!.getAddressDistric(myProfileData.profileData.districtId)}'
                        //myProfileData.profileData.address ?? 'عنوان  '
                        ),
                myProfileData.profileData.specializationFields.isEmpty
                    ? const SizedBox()
                    : CustomUserdataRow(
                        isNull: myProfileData
                                .profileData.specializationFields.isEmpty
                            ? true
                            : false,
                        img: AssetsData.kady,
                        text: myProfileData.profileData.specializationFields ==
                                []
                            ? 'التخصص'
                            : ProfileCubit.get(context)!.getSpacializationName(
                                myProfileData.profileData.specializationFields),
                      ),
                CustomUserdataRow(
                  isNull:
                      myProfileData.profileData.mobileNo == null ? true : false,
                  img: AssetsData.call,
                  text: myProfileData.profileData.mobileNo ?? 'الجوال',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
