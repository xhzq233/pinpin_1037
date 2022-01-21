/// pinpin_1037 - theme
/// Created by xhz on 2022/1/17.

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ThemeStyle {
  static final darkTheme = const NeumorphicThemeData.dark().copyWith();

  ///真正的theme
  static final lightTheme = ThemeData.light().copyWith(
      indicatorColor: const Color(0xffea638c),
      toggleableActiveColor: const Color(0xffea638c),
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme(
        primary: Color(0xffea638c),
        primaryVariant: Color(0xffbc2f58),
        secondary: Color(0xffde4f78),
        secondaryVariant: Color(0xffea638c),
        background: Colors.white,
        surface: Colors.white,
        error: Color(0xFFB00020),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        ///导航
        headline1: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1.5),

        ///标题
        headline2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5),

        ///body
        bodyText1: TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0.5),

        ///footnote
        caption: TextStyle(
            fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0.4),
      ));

  ///虚假的theme（
  static final neumorphicLightTheme = NeumorphicThemeData(
    baseColor: backgroundColor,
    depth: 4,
    buttonStyle: NeumorphicStyle(
      shape: NeumorphicShape.flat,
      depth: 4,
      // color: backgroundColor,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
    ),
  );

  static const backgroundColor = background;
  static const iconColor = Color(0xff6B92E5);
  static const publishedTimeColor = Color(0xff808084);
  static const captionColor = Color(0x8040558C);
  static const buttonBannedColor = Color(0xffE3E3E3);
  static const navigatorColor = Color(0xb240558C); //40558C 70%
  static const bodyColor = Color(0xbf40558C); //40558C 75%
  static const dateTimeBannedColor = Color(0xffB3B3B5);
  static const titleColor = Color(0xcc40558C); //40558C 80%
  static const iconBanned = Color(0xffcdcdcd);

  ///updated
  static const background = Color(0xffEBF3FA);

  ///标题，导航
  static const blue1 = Color(0xff5470BA);

  ///body
  static const blueBody = Color(0xff5E78BA);

  ///正文标题
  static const body = Color(0xff343434);

  ///突出文字，图标
  static const blue2 = Color(0xff6B92E5);

  ///输入框文字
  static const blue3 = Color(0xff7E9CDB);

  ///分割线等
  static const blue4 = Color(0xffD4DFF6);

  ///注释、辅助说明
  static const gray3 = Color(0xff808084);

  ///按钮图标禁用
  static const gray4 = Color(0xffD8D8D8);

  static const warningColor = Color(0xffFF7EAD); //#FF7EAD

  static const publishPinpinColor = Color(0xff6B92E5);

  static const dateTimePickerColor = Color(0xff6B92E5); //6B92E5

}
