/// pinpin_1037 - pinpin_detail
/// Created by xhz on 2022/1/22
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/models/global/theme.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';

class PinPinDetail extends StatelessWidget {
  final PinPinDataSource datasource;

  const PinPinDetail({required this.datasource, Key? key}) : super(key: key);

  Widget _button({
    void Function()? onPressed,
    required String img,
  }) =>
      Expanded(
        child: NeumorphicButton(
          style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(4))),
          child: Image.asset(img),
          onPressed: onPressed,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: littleIconActions(),
        actions: [
          littleIconActions(
              icons: Icons.more_horiz,
              left: false,
              onPressed: () async {
                final res = await showNeumorphicBottomDialog(
                    context: context,
                    builder: (ctx) => Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(ctx, true);
                                },
                                child: const Text(
                                  '举办',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ThemeStyle.warningColor,
                                  ),
                                )),
                            const Divider(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(ctx, false);
                                },
                                child: const Text(
                                  '取消',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ThemeStyle.blue2,
                                  ),
                                )),
                          ]
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.5),
                                    child: e,
                                  ))
                              .toList(),
                        ));
                if (res == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ReportPage(id: datasource.pinpinId!)));
                }
              })
        ],
        title: const Text(
          '拼拼详情',
          style: ThemeFont.navigator,
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 4,
        ),
        Expanded(
          flex: 8,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [

              NeumorphicDetailInfoCard(
                  largeTitle: "比赛信息",
                  caption: "发布:" +
                      datasource.getPublishedTimeResume() +
                      "\n招募截止: " +
                      datasource.expiredTime.toString().replaceFirst('Z', ''),
                  title: datasource.title!,
                  bodys: datasource.competitionIntroduction!),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "人员需求",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  NeumorphicButton(
                    padding: const EdgeInsets.all(16),
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [Spacer()],
                        ),
                        Text(
                          "团队状态: ${datasource.getQtyResume()}",
                          style: const TextStyle(fontSize: 14, height: 1.7),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "人员需求：",
                          style: TextStyle(fontSize: 14, height: 1.7),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          datasource.demandingIntroduction!,
                          style: const TextStyle(fontSize: 14, height: 1.7),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "联系方式",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  NeumorphicButton(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16, top: 12),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [Spacer()],
                          ),
                          GestureDetector(
                            onLongPress: () {
                              Clipboard.setData(ClipboardData(
                                  text: (datasource.contactQq ?? '') +
                                      ' ' +
                                      (datasource.contactTel ?? '') +
                                      ' ' +
                                      (datasource.contactWechat ?? '')));
                              neumorphicToast(context, "复制成功");
                            },
                            child: Text(datasource.getContactDetailResume(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 2.1,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 29,
                  ),
                ],
              ),
              if (datasource.haveTeamInfo)
                NeumorphicDetailInfoCard(
                  largeTitle: "成员信息",
                  title: "发起人",
                  bodys: datasource.getPersonResume(),
                  extraTitleAndBody: datasource.teammateIntroduction!.isEmpty
                      ? null
                      : [
                          '其他成员',
                          datasource.teammateIntroduction!,
                        ],
                )
            ],
          ),
        ),
        Expanded(
          child: Neumorphic(
              padding: const EdgeInsets.only(top: 7, left: 15),
              style: ThemeNeumorphicStyle.convexCard(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _button(
                      img: 'assets/icon/bookmark_fill.png',
                      onPressed: () async {

                      }),
                  const SizedBox(
                    width: 5,
                  ),
                  _button(
                      img: 'assets/icon/forward_fill.png', onPressed: () {}),
                  const SizedBox(
                    width: 5,
                  ),
                  _button(
                      img: 'assets/icon/remarks_fill.png',
                      onPressed: () {
                        showNeumorphicBottomDialog(
                            context: context,
                            builder: (ctx) => Image.asset('assets/temp.png'));
                      }),
                  const Spacer(
                    flex: 3,
                  )
                ],
              )),
        )
      ]),
    );
  }
}
