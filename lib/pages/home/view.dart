import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pinpin_1037/components/snap_card.dart';
import 'package:pinpin_1037/components/toggle_element.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/models/global/theme.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/pages/drawer/home_drawer.dart';
import 'package:pinpin_1037/routes/routes.dart';
import 'package:search_page/search_page.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final datalogic = Get.find<HomeDataLogic>();
    return Scaffold(
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
            builder: (logic) => Visibility(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NeumorphicButton(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      depth: -3.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          const BorderRadius.all(Radius.circular(12))),
                    ),
                    onPressed: () => showSearch(
                      context: context,
                      delegate: SearchPage<PinPinDataSource>(
                        onQueryUpdate: (s) => log(s),
                        items: datalogic.data,
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
                    height: 9,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      NeumorphicToggle(
                        selectedIndex: datalogic.currentTab ? 0 : 1,
                        children: [
                          toggleElement(str: "全部"), //tab 为 0
                          toggleElement(str: "只看我的"),
                        ],
                        thumb: Neumorphic(),
                        onChanged: (value) =>
                            datalogic.changeCurrentTab(value == 0),
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
          GetBuilder<HomeDataLogic>(
              builder: (logic) => Expanded(
                    child: LoadingMoreList(
                      ListConfig<PinPinDataSource>(
                        itemBuilder: (ctx, data, index) =>
                            NeumorphicSnapButtonCard(
                          datasource: data,
                        ),
                        sourceList: logic.data,
                        padding: const EdgeInsets.all(0),
                      ),
                    ),
                  ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NeumorphicFloatingActionButton(
        onPressed: () async {
          Get.toNamed(Routes.home + Routes.postPinPin);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: const HomeDrawerPage(),
    );
  }
}
