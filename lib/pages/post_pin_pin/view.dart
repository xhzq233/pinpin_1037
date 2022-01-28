import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/components/custom_dialog/logic.dart';
import 'package:pinpin_1037/components/custom_dialog/view.dart';
import 'package:pinpin_1037/components/neumorphic_text_field/view.dart';

import 'package:pinpin_1037/components/show_dialog.dart';
import 'package:pinpin_1037/components/submit_button.dart';
import 'package:pinpin_1037/components/toggle_element.dart';
import 'package:pinpin_1037/components/utils/keep_alive_wrapper.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/api_client.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/utils/validators.dart';
import 'logic.dart';

class PostPinPinPage extends StatelessWidget {
  const PostPinPinPage({Key? key}) : super(key: key);

  Widget _padding({required Widget child}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PostPinPinLogic>();
    return Scaffold(
        appBar: NeumorphicAppBar(
          title: const Text(
            "发布拼拼",
            style: ThemeStyle.headline1,
          ),
        ),
        body: Column(
          children: [
            _padding(
                child: GetBuilder<PostPinPinLogic>(
                    assignId: true,
                    builder: (controller) => Neumorphic(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      style: const NeumorphicStyle(
                          depth: -5,
                          boxShape: NeumorphicBoxShape.stadium()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _tabBarItem(controller,
                              index: 0, ic: Icons.emoji_events),
                          _progress(controller.progress1),
                          _tabBarItem(
                            controller,
                            index: 1,
                            ic: Icons.person_add_alt_1,
                          ),
                          _progress(controller.progress2),
                          _tabBarItem(
                            controller,
                            index: 2,
                            ic: Icons.group_add_rounded,
                          ),
                        ],
                      ),
                    ))),
            Expanded(
              flex: 10,
              child: ListView(
                itemExtent: Get.height * 0.65,
                children: [
                  PageView.builder(
                      controller: logic.controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      onPageChanged: logic.onTabChange,
                      itemBuilder: (ctx, index) => index == 0
                          ? KeepAliveWrapper(child: _page1(context, logic))
                          : index == 1
                          ? KeepAliveWrapper(child: _page2(logic))
                          : KeepAliveWrapper(child: _page3(logic)))
                ],
              ),
            ),
            _padding(
                child: GetBuilder<PostPinPinLogic>(
                  builder: (controller) => submitButton(
                      (controller.progress1 + controller.progress2)
                          .every((element) => element),
                      onSubmit: () async {
                        final bool? res = await showNeumorphicDialog(
                          barrierDismissible: false,
                            context: context,
                            builder: (BuildContext ctx) {
                              return CustomDialogComponent(
                                  future: ApiClient.postPinPinDataSource,
                                  data: controller.dataWaitedForPost,
                                  leading: '继续核对',
                                  trailing: '确认发布',
                                  title: '请核对好您的信息后确认发布',
                                  resultHint: '发布成功');
                            });
                        if (res == true) {
                          Get.back(result: true);
                        }
                      },
                      text: '确认发布',
                      onLose: () {
                        toast("您还未填写完毕或填写不正确!");
                      }),
                )),
            const Spacer(),
          ],
        ));
  }

  Widget _sizedWrap(Widget child, {double widthFac = 0.8}) => SizedBox(
        width: Get.width * widthFac,
        child: child,
      );

  Widget _page1(BuildContext context, PostPinPinLogic logic) {
    return _padding(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          NeumorphicTextFieldComponent(
            hint: '比赛名称',
            validator: Validators.isNotEmpty,
            stringDataCallback: (str) {
              logic.contestName = str;
              logic.updateProgress1();
            },
          ),
          const Text(
            "联系方式,至少填一项",
            style: ThemeStyle.caption,
          ),
          NeumorphicTextFieldComponent(
            hint: 'QQ',
            validator: Validators.qqNumber,
            stringDataCallback: (str) {
              logic.qq = str;
              logic.updateProgress1();
            },
            keyboardType: TextInputType.number,
          ),
          NeumorphicTextFieldComponent(
            hint: 'WeChat',
            validator: Validators.vxNumber,
            stringDataCallback: (str) {
              logic.vx = str;
              logic.updateProgress1();
            },
          ),
          NeumorphicTextFieldComponent(
            hint: 'Tel',
            validator: Validators.vxNumber,
            keyboardType: TextInputType.number,
            stringDataCallback: (str) {
              logic.tel = str;
              logic.updateProgress1();
            },
          ),
          GetBuilder<PostPinPinLogic>(
            builder: (logic) => NeumorphicButton(
              onPressed: () => logic.selectDate(context),
              child: Text(
                !logic.showDate
                    ? "选择截止日期"
                    : "${logic.selectedDate.year}-${logic.selectedDate.month}-${logic.selectedDate.day}",
                style: ThemeStyle.bodyText1,
              ),
            ),
          ),
          const Text(
            "到截止日期后,本拼拼贴将自动删除",
            style: ThemeStyle.caption,
          ),
          NeumorphicTextFieldComponent(
            hint: '项目简介',
            validator: Validators.noMatter,
            maxLength: 100,
            keyboardType: TextInputType.number,
            maxLines: null,
            stringDataCallback: (str) {
              logic.contestInfo = str;
            },
            radius: 15,
          ),
          const Text(
            "选填,不超过100字,简要介绍你的参赛内容",
            style: ThemeStyle.caption,
          ),
        ]));
  }

  Widget _page2(PostPinPinLogic logic) => _padding(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        Neumorphic(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("共需", style: ThemeStyle.bodyText1),
              _sizedWrap(
                  NeumorphicTextFieldComponent(
                    hint: '',
                    keyboardType: TextInputType.number,
                    validator: Validators.isNum,
                    stringDataCallback: (str) {
                      logic.num1 = str;
                      logic.updateProgress2();
                    },
                  ),
                  widthFac: 1 / 6),
              const Text(
                "人 ,  已有",
              ),
              _sizedWrap(
                  NeumorphicTextFieldComponent(
                    hint: '',
                    validator: Validators.isNum,
                    keyboardType: TextInputType.number,
                    stringDataCallback: (str) {
                      logic.num2 = str;
                      logic.updateProgress2();
                    },
                  ),
                  widthFac: 1 / 6),
              const Text("人")
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        NeumorphicTextFieldComponent(
            hint: '人员需求情况',
            validator: Validators.isNotEmpty,
            maxLines: null,
            stringDataCallback: (str) {
              logic.infoDemanded = str;
              logic.updateProgress2();
            },
            maxLength: 200,
            radius: 15),
        const Text(
          "必填，不超过200字，可以简要介绍需求人员类型、专业/技能要求、需要承担的任务",
          style: ThemeStyle.caption,
        ),
        const Spacer()
      ]));

  Widget _page3(PostPinPinLogic logic) {
    return _padding(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          const Text(
            "我的信息",
          ),
          const Text(
            "基本信息（选填，可匿名）",
          ),
          Row(
            children: [
              _sizedWrap(
                  NeumorphicTextFieldComponent(
                    hint: '姓名',
                    validator: Validators.noMatter,
                    maxLines: null,
                    stringDataCallback: (str) {
                      logic.leaderName = str;
                    },
                  ),
                  widthFac: 0.3),
              Builder(
                  builder: (ctx) => NeumorphicToggle(
                        width: Get.width * 0.36,
                        selectedIndex: logic.selectedGender,
                        displayForegroundOnlyIfSelected: true,
                        children: [
                          toggleElement(str: "保密"),
                          toggleElement(str: "男"),
                          toggleElement(str: "女"),
                        ],
                        thumb: Neumorphic(),
                        onChanged: (value) {
                          logic.selectedGender = value;
                          (ctx as Element).markNeedsBuild(); //刷新
                        },
                      )),
            ],
          ),
          NeumorphicTextFieldComponent(
            hint: '年级-专业',
            validator: Validators.noMatter,
            maxLines: null,
            stringDataCallback: (str) {
              logic.leaderDepartment = str;
            },
          ),
          const Text(
            "我的简介（选填，不超过100字，可以介绍自己的经验技能等）",
          ),
          NeumorphicTextFieldComponent(
              hint: '我的简介',
              validator: Validators.noMatter,
              maxLines: null,
              maxLength: 100,
              stringDataCallback: (str) {
                logic.leaderInfo = str;
              },
              radius: 15),
          const Text(
            "队员信息",
            style: ThemeStyle.headline2,
          ),
          const Text(
            "选填，不超过100字，可以介绍成员的专业、技能等基础情况",
            // style: ThemeFont.formCaption,
          ),
          NeumorphicTextFieldComponent(
              hint: '队员简介',
              validator: Validators.noMatter,
              maxLines: null,
              maxLength: 100,
              stringDataCallback: (str) {
                logic.teamMateInfo = str;
              },
              radius: 15),
        ]));
  }

  Widget _progress(List<bool> relate) => SizedBox(
        width: Get.width / 7,
        child: NeumorphicProgress(
          style: const ProgressStyle(
            depth: 5,
          ),
          percent: relate
                  .map((e) => e ? 1 : 0)
                  .reduce((value, element) => value + element) /
              relate.length,
        ),
      );

  Widget _tabBarItem(PostPinPinLogic logic,
          {required int index, required IconData ic}) =>
      SizedBox(
        child: NeumorphicButton(
          onPressed: () => logic.animateTo(index),
          style: const NeumorphicStyle(
            depth: 7,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Icon(
            ic,
            color: logic.tabIndex == index
                ? ThemeStyle.iconColor
                : ThemeStyle.iconBanned,
          ),
        ),
        width: Get.width / 6,
      );
}
