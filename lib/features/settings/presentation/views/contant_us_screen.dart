import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContantUsScreen extends StatelessWidget {
  const ContantUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          title: Text(
            AppLocalizations.of(context)!.contactUs,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.dg),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              CustomContentUsContainer(
                text: AppLocalizations.of(context)!.contantUsWithWhats,
                img: AssetsData.whatsApp,
                function: () async {
                  Uri whatsApp = Uri.parse('https://wa.me/+201282189092');
                  launchUrl(whatsApp);
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomContentUsContainer(
                img: AssetsData.mail,
                text: AppLocalizations.of(context)!.contantUsWithmail,
                function: () async {
                  Uri mail = Uri.parse("mailto:$email?subject=$subject&body= ");
                  if (await launchUrl(mail)) {
                    //email app opened
                  } else {
                    if (kDebugMode) {
                      print('not working');
                    }
                  }
                },
              )
            ],
          ),
        ));
  }
}

class CustomContentUsContainer extends StatelessWidget {
  const CustomContentUsContainer(
      {super.key,
      required this.text,
      required this.img,
      required this.function});
  final String text;
  final String img;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 170.h,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: TextButton(
                    onPressed: function,
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: kPrimaryKey,
                          decoration: TextDecoration.underline),
                    )),
              )
            ]));
  }
}
