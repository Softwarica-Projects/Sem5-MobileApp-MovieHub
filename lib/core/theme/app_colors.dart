import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const primary = Color(0xFF12CDD9);
  static const primaryBackgroundShade = Color(0xff05E9F7);

  static const secondary = Color(0xffFF8700);

  static const blueHighlightColor = Color(0xFF3E97FF);
  static const blueHighlightyBackgroundShade = Color(0xffB8E3DB);
  static const blueHighlightBackgroundShade2 = Color(0xffE2F1FF);

  static const bottomBarSelectedColor = primary;
  static const tabLabelBoxColor = Color(0xff252836);
  static MaterialColor primaryMaterialColor = MaterialColor(primary.value, const {
    50: primary,
    100: primary,
    200: primary,
    300: primary,
    400: primary,
    500: primary,
    600: primary,
    700: primary,
    800: primary,
    900: primary,
  });

  static const cardBackgroundColor = Color(0xff252836);
  static const greenColor = Color(0xff50CD89);
  static const greenBackgroundShade = Color(0xffB3FADE);
  static const greenBackgroundShade2 = Color(0xffEFFDF7);

  static const pendingColor = Color(0xffFFA337);
  static const pendingBackgroundShade2 = Color(0xffFFE0AD);
  static const pendingBackgroundShade = Color(0xffFFF5E9);

  static const kHintColorText = Color(0xFF7E8299);

  static final kColorError = Colors.red[800]!;
  static const kColorBackground = Color(0xff1F1D2B);
  static const favouriteIcon = Color(0xffFF69B4);

  static const kColorBackgroundSecondary = Color(0xffF9F9F9);
  static const kColorButtonPrimary = kPrimaryButton;
  static get kColorButtonSecondary => secondary;
  static const kColorOutlineButton = Color(0xffFAFAFA);
  static const kColorOutlineButtonBorder = Color(0xffECEBEC);
  static const kColorDottedBorder = Color(0xffD8D8E5);
  static const kCheckBoxBorder = Color(0xffBFBBBD);
  static const kBorderColor = Color(0xffE1E3EA);
  static const kInputDecorationIconColor = Color(0xff7E8299);

  static const kColorDivier = kColorOutlineButtonBorder;

  static const kChipSelectedColor = primary;
  static const kChipUnselectedColor = kColorOutlineButton;
}
