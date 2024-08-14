import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTitleAppBar extends StatelessWidget {
  const CustomTitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          child: getIt
                      .get<CashHelperSharedPreferences>()
                      .getData(key: ApiKey.profilePic) !=
                  null
              ? ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      imageUrl: getIt
                          .get<CashHelperSharedPreferences>()
                          .getData(key: ApiKey.profilePic)),
                )
              : const Icon(Icons.person),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.welcom,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kDarktBlue),
              ),
              Text(
                getIt
                    .get<CashHelperSharedPreferences>()
                    .getData(key: ApiKey.userName),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: kDarktBlue),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
