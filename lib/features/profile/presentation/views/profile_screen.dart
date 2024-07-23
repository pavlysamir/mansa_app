import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/features/profile/presentation/widgets/icon_profile_appBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconProfileAppBar(
              function: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50,
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 80.dg,
                  color: klightBlue,
                ),

                //  CachedNetworkImage(
                //   width: double.infinity,
                //   fit: BoxFit.fitHeight,
                //   imageUrl: userModel!.image!,
                //   placeholder: (context, url) => const Center(
                //     child: CircularProgressIndicator(
                //         color: kPrimaryKey, strokeWidth: 1),
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              getIt
                  .get<CashHelperSharedPreferences>()
                  .getData(key: ApiKey.userName),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: kDarktBlue),
            ),
            const SizedBox(
              width: double.infinity,
            ),
          ],
        ));
  }
}
