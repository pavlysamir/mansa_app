import 'package:flutter/material.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.notification,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Center(child: Image.asset(AssetsData.noNotification)),
    );
  }
}
