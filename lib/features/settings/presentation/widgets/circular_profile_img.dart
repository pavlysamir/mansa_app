import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipOval(
                child: CircleAvatar(
                    radius: 75.h,
                    backgroundColor: kBlackColor,
                    child: SettingsCubit.get(context)!.file == null
                        ? Icon(
                            Icons.person,
                            size: 75.h,
                            color: Colors.white,
                          )
                        : Image.file(
                            SettingsCubit.get(context)!.file!,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          )),
              ),
              IconButton(
                onPressed: () {
                  SettingsCubit.get(context)!.pickCameraImage();
                },
                icon: Icon(
                  color: kPrimaryKey,
                  Icons.add_a_photo,
                  size: 32.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
