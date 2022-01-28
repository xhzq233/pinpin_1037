/// pinpin_1037 - theme
/// Created by xhz on 2022/1/17.

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ThemeStyle {
  static final darkTheme = const NeumorphicThemeData.dark().copyWith();

  ///真正的theme
  static final lightTheme = ThemeData.light().copyWith(
      indicatorColor: blue2,
      toggleableActiveColor: blue2,
      backgroundColor: backgroundColor,
      primaryColor: blue1,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme(
        primary: blue2,
        primaryVariant: blue1,
        secondary: blue3,
        secondaryVariant: blue2,
        background: backgroundColor,
        surface: backgroundColor,
        error: warningColor,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: backgroundColor,
        brightness: Brightness.light,
      ),);

  ///虚假的theme（
  static final neumorphicLightTheme = NeumorphicThemeData(
      baseColor: backgroundColor,
      accentColor: blue2,
      borderColor: captionColor,
      variantColor: Colors.black,
      defaultTextColor: blue3,
      disabledColor: gray4,
      depth: 4,
      buttonStyle: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 4,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
      ),
      boxShape: NeumorphicBoxShape.roundRect(
          const BorderRadius.all(Radius.circular(15))));

  ///导航
  static const headline1 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1.5,color: blue1);

  ///标题
  static const headline2 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5,color: Colors.black);

  ///body
  static const bodyText1 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 0.5,color: Colors.black);

  ///footnote
  static const caption = TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, letterSpacing: 0.4,color: gray4);


  ///color

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
