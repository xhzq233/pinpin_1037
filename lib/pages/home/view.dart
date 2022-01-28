import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pinpin_1037/components/snap_card.dart';
import 'package:pinpin_1037/components/toggle_element.dart';
import 'package:pinpin_1037/components/utils/keep_alive_wrapper.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/components/utils/toast.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/i18n/i18n.dart';
import 'package:pinpin_1037/models/data_source/pinpin_list_source.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/pages/drawer/home_drawer.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:search_page/search_page.dart';
import 'logic.dart';

DateTime? _lastPopTime;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final datalogic = Get.find<HomeDataLogic>();

    return WillPopScope(
      onWillPop: () async {
        if (null == _lastPopTime ||
            DateTime.now().difference(_lastPopTime!) >
                const Duration(seconds: 1)) {
          _lastPopTime = DateTime.now();
          toast(I18n.doubleClickExitHint.tr);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: NeumorphicAppBar(
            title: const Text(
              '1037拼拼',
              style: ThemeStyle.headline1,
            ),
            actions: [
              littleIconActions(
                  icons: Icons.more_horiz,
                  left: false,
                  onPressed: () {
                    logic.showOrHideFilterBar();
                  }),
            ],
            leading: Builder(
              builder: (context) {
                return littleIconActions(
                    left: false,
                    icons: Icons.person,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              },
            )),
        body: Column(
          children: [
            GetBuilder<HomeLogic>(
              assignId: true,
              builder: (logic) => Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NeumorphicButton(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 4),
                      style: const NeumorphicStyle(
                        depth: -5,
                      ),
                      onPressed: () async => showSearch<PinPinDataSource?>(
                        context: context,
                        delegate: SearchPage<PinPinDataSource>(
                          onQueryUpdate: (s) => log(s),
                          items: await datalogic.data,
                          searchLabel: '搜索拼拼',
                          suggestion: const Center(
                            child: Text('搜索想看的拼拼'),
                          ),
                          failure: const Center(
                            child: Text('暂时找不到:('),
                          ),
                          filter: (data) => [
                            data.title,
                            data.demandingIntroduction,
                            data.masterIntroduction,
                            data.masterName,
                            data.teammateIntroduction,
                            data.competitionIntroduction
                          ],
                          builder: (data) => Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 20),
                            child: NeumorphicSnapButtonCard(
                              datasource: data,
                            ),
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [Icon(Icons.search), Spacer()],
                      ),
                    ),
                    const Divider(
                      indent: 25,
                      endIndent: 25,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        NeumorphicToggle(
                          width: Get.width * 0.36,
                          selectedIndex: datalogic.currentTab ? 0 : 1,
                          children: [
                            toggleElement(str: "全部"), //tab 为 0
                            toggleElement(str: "只看我的"),
                          ],
                          thumb: Neumorphic(),
                          onChanged: (value) {
                            datalogic.changeCurrentTab(value == 0);
                            logic.update();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                visible: logic.isShowFilterBar,
              ),
            ),
            Expanded(
                child: PageView.builder(
              controller: datalogic.controller,
              itemCount: 2,
              onPageChanged: (i) {
                datalogic.currentTab = i == 0;
                logic.update(); //将上面的部件也更新
              },
              itemBuilder: (BuildContext context, int i) => KeepAliveWrapper(
                  child: LoadingMoreList(
                ListConfig<PinPinDataSource>(
                  primary: true,
                  itemBuilder: (ctx, data, index) => NeumorphicSnapButtonCard(
                    datasource: data,
                  ),
                  sourceList: PinPinListSource(
                      dataType: i == 0
                          ? DataType.totalPinPin
                          : DataType.personalPinPin),
                ),
              )),
            ))
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: NeumorphicFloatingActionButton(
          style: const NeumorphicStyle(
              color: ThemeStyle.blue2, boxShape: NeumorphicBoxShape.circle()),
          onPressed: () async {
            Get.toNamed(Routes.home + Routes.postPinPin);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        drawer: const HomeDrawerPage(),
      ),
    );
  }
}
