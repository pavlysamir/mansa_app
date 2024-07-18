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
          radius: 20.dg,
          child: const Icon(Icons.person),
        ),
        SizedBox(width: 12.w),
        Column(
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
            ),
          ],
        )
      ],
    );
  }
}
