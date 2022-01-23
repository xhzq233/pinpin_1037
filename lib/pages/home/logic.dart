import 'package:get/get.dart';
import 'package:pinpin_1037/models/data_source/pinpin_list_source.dart';

class HomeLogic extends GetxController {
  bool isShowFilterBar = false;

  void showOrHideFilterBar() {
    isShowFilterBar = !isShowFilterBar;
    update();
  }
}

///分别管理data和页面逻辑
class HomeDataLogic extends GetxController {
  static const all = true;
  static const onlyMe = false;

  bool currentTab = all;

  ///这里的data被使用完后会不会被释放?TODO
  PinPinListSource get data => PinPinListSource(
      dataType:
          currentTab == all ? DataType.totalPinPin : DataType.personalPinPin);

  void changeCurrentTab(bool c) {
    currentTab = c;
    update();
  }
}
