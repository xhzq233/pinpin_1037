/// pinpin_1037 - page_padding_wrapper
/// Created by xhz on 2022/1/24
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget pagePaddingWrap({required Widget child}) => Row(
      children: [
        const Spacer(),
        Expanded(flex: 8, child: child),
        const Spacer()
      ],
    );
