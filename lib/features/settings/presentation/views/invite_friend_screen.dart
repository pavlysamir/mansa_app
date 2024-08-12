import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/api/end_ponits.dart';
import 'package:mansa_app/core/utils/service_locator.dart';
import 'package:mansa_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:mansa_app/core/utils/widgets/custom_form_field.dart';
import 'package:mansa_app/features/settings/presentation/managers/settings_cubit/settings_cubit.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.inviteFriend,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.dg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Image.asset(AssetsData.inviteFriend),
              Text(
                AppLocalizations.of(context)!.inviteFriendQuote,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                AppLocalizations.of(context)!.inviteFriendHints,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 30.h,
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  SettingsCubit.get(context)!.codeController.text = getIt
                      .get<CashHelperSharedPreferences>()
                      .getData(key: ApiKey.referCode);

                  return Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                          controller:
                              SettingsCubit.get(context)!.codeController,
                          hintText: '',
                          textInputType: TextInputType.text,
                          readOnly: true,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: SettingsCubit.get(context)!
                                    .codeController
                                    .text));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Copied'),
                              ),
                            );
                          },
                          icon: const Icon(Icons.copy)),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
