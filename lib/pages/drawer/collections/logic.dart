import 'package:get/get.dart';

import 'package:pinpin_1037/models/data_source/pinpin_list_source.dart';

class CollectionsLogic extends GetxController {
  final data = PinPinListSource(dataType: DataType.followedPinPin);

}
