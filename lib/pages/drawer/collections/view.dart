import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:pinpin_1037/components/snap_card.dart';
import 'package:pinpin_1037/components/utils/small_icon.dart';
import 'package:pinpin_1037/global/theme.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'logic.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CollectionsLogic>();

    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text(
          '我的收藏',
          style: ThemeStyle.headline1,
        ),
        leading: littleIconActions(onPressed: Get.back),
      ),
      body: LoadingMoreList(
        ListConfig<PinPinDataSource>(
          primary: true,
          itemBuilder: (ctx, data, index) => NeumorphicSnapButtonCard(
            datasource: data,
          ),
          sourceList: logic.data,
        ),
      ),
    );
  }
}
