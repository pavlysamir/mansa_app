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
                CustomUserdataRow(
                    img: AssetsData.nkaba,
                    text: ProfileCubit.get(context)!.getNkabaName(
                        myProfileData.profileData.barAssociationsId)),
                CustomUserdataRow(
                  img: AssetsData.mizan,
                  text: ProfileCubit.get(context)!.getBacaloryName(
                      myProfileData.profileData.generalLawBachelorId),
                ),
                CustomUserdataRow(
                  img: AssetsData.address,
                  text: myProfileData.profileData.address,
                ),
                CustomUserdataRow(
                  img: AssetsData.kady,
                  text: ProfileCubit.get(context)!.getSpacializationName(
                      myProfileData.profileData.specializationFields),
                ),
                CustomUserdataRow(
                  img: AssetsData.call,
                  text: myProfileData.profileData.mobileNo,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
