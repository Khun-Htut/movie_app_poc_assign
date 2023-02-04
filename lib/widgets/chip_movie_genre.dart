import 'package:flutter/material.dart';

import '../consts/colors.dart';
import '../consts/dimens.dart';
import 'easy_text_widget.dart';

class ChipMovieGenre extends StatelessWidget {
  const ChipMovieGenre(
      {Key? key,
      required this.movieGenre,
      required this.fontSize,
      required this.fontWeight,
      required this.backGroundColor})
      : super(key: key);
  final String movieGenre;
  final double fontSize;
  final FontWeight fontWeight;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: EasyTextWidget(
        text: movieGenre,
        fontSize: fontSize,
        fontWeight:fontWeight,
      ),
      backgroundColor: backGroundColor,
    );
  }
}
