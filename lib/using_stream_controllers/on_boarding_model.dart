import 'package:flutter/material.dart';

class OnBoardingModel {
  const OnBoardingModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "desc",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Image? imageAssetPath;
  final String title;
  final TextStyle? titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle? descStyle;
  final double miniDescFontSize;
}
