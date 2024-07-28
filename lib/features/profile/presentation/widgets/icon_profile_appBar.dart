import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IconProfileAppBar extends StatelessWidget {
  const IconProfileAppBar({
    super.key,
    required this.function,
  });
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: kDarktBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.edit,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.edit, size: 20, color: Colors.white)
                ],
              ),
            )));
  }
}
