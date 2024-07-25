import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBalanceScreen extends StatelessWidget {
  const MyBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.editProfile,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
