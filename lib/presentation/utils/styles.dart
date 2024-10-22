import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monie_estate/presentation/values/colors.dart';
import 'package:monie_estate/presentation/values/fonts.dart';

class AppStyles {

  static ThemeData lightTheme = ThemeData().copyWith(
    primaryColorLight: AppColors.pryLight,
    primaryColorDark: AppColors.pryDark,
    primaryColor: AppColors.pry,
    appBarTheme: _appBarTheme,
    canvasColor: Colors.transparent,
    cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: AppColors.pryDark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.pryDark,
        selectionColor: AppColors.pryLight
    ),

    );

  static const AppBarTheme _appBarTheme = AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark, color: Colors.white);


}

class TextStyles {

  static const TextStyle bodyLightTheme = TextStyle(
      fontFamily: Fonts.familyName,
      color: AppColors.pryBodyText,
      fontSize: FontSizes.bodyText,
      fontWeight: FontWeight.normal,
      height: 1.2
  );
  
  static const TextStyle pryBody = TextStyle(
    fontSize: FontSizes.bodyText,
    fontWeight: FontWeight.normal,
    color: AppColors.pryBodyText,
  );

  static const TextStyle h1 = TextStyle(
    fontSize: FontSizes.h2Text,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: FontSizes.h2Text,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: FontSizes.h3Text,
    fontWeight: FontWeight.w700,
  );

  static TextStyle pryNormalH4 = h1.copyWith(fontWeight: FontWeight.normal);

  static TextStyle boldSecBody = pryBody.copyWith(fontWeight: FontWeight.bold);



}

String darkMapStyle = '''
  [
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#303030"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#2c2c2c"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#181818"
        }
      ]
    }
  ]
  ''';
