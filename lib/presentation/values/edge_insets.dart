
import 'package:flutter/material.dart';
import 'package:monie_estate/presentation/values/dimens.dart';

class AppEdgeInsets {
  static const EdgeInsets screen = EdgeInsets.symmetric(
      horizontal: AppDimens.screenHorMargin,
      vertical: AppDimens.screenVertMargin
  );

  static const EdgeInsets container = EdgeInsets.symmetric(
      horizontal: AppDimens.screenHorMargin,
      vertical: AppDimens.screenVertMargin
  );



  static const EdgeInsets appBarPadding =
  EdgeInsets.only( top: 20.0, bottom: 10.0);
}