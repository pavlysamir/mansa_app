import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/core/utils/widgets/custom_button_small.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog(
      {super.key,
      required this.context,
      required this.function,
      required this.title,
      required this.subTitle,
      this.colorButton1 = kPrimaryKey,
      this.textColortcolor1 = Colors.white,
      this.colorButton2 = kPrimaryKey,
      this.textColortcolor2 = Colors.white,
      required this.function2,
      required this.img});
  final BuildContext context;
  final Function() function;
  final String title;
  final String subTitle;
  final Color colorButton1;
  final Color colorButton2;
  final Color textColortcolor1;
  final Color textColortcolor2;
  final Function() function2;
  final String img;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(img),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonSmall(
                borderColor: Colors.grey,
                width: 100,
                text: AppLocalizations.of(context)!.yes,
                color: colorButton1,
                function: function,
                textColortcolor: textColortcolor1,
              ),
              CustomButtonSmall(
                borderColor: Colors.grey,
                width: 100,
                text: AppLocalizations.of(context)!.no,
                textColortcolor: textColortcolor2,
                color: colorButton2,
                function: function2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PopUpDialogOneButton extends StatelessWidget {
  const PopUpDialogOneButton(
      {super.key,
      required this.context,
      required this.function,
      required this.title,
      required this.subTitle,
      this.colorButton1 = kPrimaryKey,
      this.textColortcolor1 = Colors.white,
      required this.textbtn});
  final BuildContext context;
  final Function() function;
  final String title;
  final String subTitle;
  final Color colorButton1;
  final Color textColortcolor1;
  final String textbtn;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(AssetsData.deleteAccount),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: CustomButtonSmall(
            borderColor: Colors.red,
            width: 100,
            text: textbtn,
            color: colorButton1,
            function: function,
            textColortcolor: textColortcolor1,
          ),
        )
      ],
    );
  }
}

class PopUpDialogReturnPoints extends StatelessWidget {
  const PopUpDialogReturnPoints({
    super.key,
    required this.context,
    required this.function,
    required this.widget,
    required this.function2,
  });
  final BuildContext context;
  final Function() function;
  final Widget widget;
  final Function() function2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: function,
                icon: const Icon(
                  IconlyLight.close_square,
                  color: kPrimaryKey,
                ),
              ),
            ),
            Image.asset(AssetsData.notes),
            SizedBox(height: 24.h),
            widget,
          ],
        ),
      ),
    );
  }
}

class PopUpDialogDropDown extends StatelessWidget {
  const PopUpDialogDropDown({
    super.key,
    required this.context,
    required this.function,
    required this.widget,
    required this.function2,
  });
  final BuildContext context;
  final Function() function;
  final Widget widget;
  final Function() function2;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: function,
                icon: const Icon(
                  IconlyLight.close_square,
                  color: kPrimaryKey,
                ),
              ),
            ),
            Image.asset(AssetsData.notes),
            SizedBox(height: 24.h),
            ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Text('aaaaaaaaaaaaaaaaa');
                }),
          ],
        ),
      ),
    );
  }
}
