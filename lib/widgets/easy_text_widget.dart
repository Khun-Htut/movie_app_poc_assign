import 'package:flutter/material.dart';
import 'package:movie_app_poc_assign/consts/colors.dart';
import 'package:movie_app_poc_assign/consts/dimens.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget(
      {Key? key,
      required this.text,
      this.fontSize = kFontSize16x,
      this.fontWeight = FontWeight.w400,
      this.color = kWhiteColor,
        this.textDecorationUnderline = TextDecoration.none
      })
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  //final TextOverflow? overFlow;
  final TextDecoration textDecorationUnderline;
  @override
  Widget build(BuildContext context) {
    return   Text(
      text,
      //overflow:overFlow,

      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color,decoration: textDecorationUnderline),
    );
  }
}
