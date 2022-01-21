/// pinpin_1037 - PinPinSnapCard
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/pages/pinpin_detail.dart';

class NeumorphicSnapButtonCard extends StatelessWidget {
  final PinPinDataSource datasource;

  const NeumorphicSnapButtonCard({required this.datasource, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      onPressed: () {
        Get.to(PinPinDetail(datasource: datasource));
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          datasource.title!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 1.4,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "拼拼状态:" + datasource.getQtyResume(),
          // style: ThemeFont.cardBody,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "人员需求：" + datasource.demandingIntroduction!,
          // style: ThemeFont.cardBody,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icon/bookmark.png',
              width: 25,
              height: 25,
            ),
            Text(
              datasource.getPublishedTimeResume(),
              // style: ThemeFont.cardTime,
            ),
          ],
        ),
      ]),
    );
  }
}
