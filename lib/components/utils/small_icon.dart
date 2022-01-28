/// pinpin_1037 - small_icon
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/global/theme.dart';

///小图标！！
littleIconActions(
        {IconData icons = Icons.arrow_back_ios,
        bool left = true,
        double edge = 2,
        void Function()? onPressed}) =>
    LayoutBuilder(
      //自定义左上角返回
      builder: (BuildContext context, BoxConstraints constraints) {
        final size = constraints.maxHeight / 5;
        final double bias = left ? size / edge : 0;
        return NeumorphicButton(
          margin: EdgeInsets.all(size),
          padding: EdgeInsets.only(left: bias),
          //不知道为什么icon会往左偏一点，所以我把它矫正过来
          style: NeumorphicStyle(
            depth: 3,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(4))),
          onPressed: onPressed ?? () => Get.back(),
          child: Icon(icons,color: ThemeStyle.blue2,),
        );
      },
    );
