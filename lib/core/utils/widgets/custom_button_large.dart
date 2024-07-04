import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge(
      {Key? key,
      required this.text,
      // required this.color,
      required this.textColor,
      required this.function,
      this.icon})
      : super(key: key);
  final String text;
  // final Color color;
  final Color textColor;
  final Function() function;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          //color: color,
          gradient: const LinearGradient(colors: buttonGradient),
          border: Border.all(color: kPrimaryKey),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
            child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.labelLarge,
            children: [
              TextSpan(
                  text: text,
                  style: GoogleFonts.almarai(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  )
                  // const TextStyle(
                  //   fontFamily: ,
                  //   overflow: TextOverflow.ellipsis)

                  ),
              WidgetSpan(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: icon,
              )),
            ],
          ),
        )),
      ),
    );
  }
}
