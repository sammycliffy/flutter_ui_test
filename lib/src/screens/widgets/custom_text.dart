import 'package:flutter/material.dart';

Widget customText(
        {required String text,
        required double fontSize,
        required Color textColor,
        TextDecoration? textDecoration,
        GlobalKey? key,
        double? wordSpacing,
        double? letterSpacing,
        double? lineHeight,
        TextOverflow? textOverflow,
        FontWeight? fontWeight,
        String? fontFamily,
        TextAlign? textAlignment}) =>
    Text(text,
        key: key,
        textAlign: textAlignment ?? TextAlign.left,
        overflow: textOverflow,
        style: TextStyle(
            decoration: textDecoration ?? TextDecoration.none,
            height: lineHeight,
            wordSpacing: wordSpacing,
            letterSpacing: letterSpacing,
            fontFamily: 'SFPRODISPLAYREGULAR',
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize));
