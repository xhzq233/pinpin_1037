import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/models/global/theme.dart';
import 'logic.dart';

///应用场景例：
///是否确定删除？
///是      否
///确认后通过[future]加载数据[data]
class CustomDialogComponent<T> extends StatelessWidget {
  CustomDialogComponent(
      {Key? key,
      required Future<void> Function(T) future, //不能直接把future传进来，不然传进来的时候就计算好了
      required this.leading,
      required this.trailing,
      required this.title,
      required this.resultHint,
      required T data})
      : super(key: key) {
    Get.put(CustomDialogLogic(future: future, data: data));
  }

  final String leading;
  final String trailing;
  final String title;
  final String resultHint;

  @override
  Widget build(BuildContext context) {
    //TODO 看看put

    return GetBuilder<CustomDialogLogic>(builder: (logic) {
      switch (logic.state) {
        case DialogState.waitingConfirm:
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: ThemeStyle.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back(result: false);
                    },
                    child: Text(
                      leading,
                      style: ThemeStyle.headline2,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      logic.confirm();
                    },
                    child: Text(
                      trailing,
                      style: ThemeStyle.headline2,
                    ),
                  )
                ],
              )
            ],
          );
        case DialogState.complete:
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(alignment: Alignment.center, children: const [
                Center(
                  child: SizedBox(
                    height: 66,
                    width: 66,
                    child: CircularProgressIndicator(
                      value: 1,
                      color: ThemeStyle.iconColor,
                    ),
                  ),
                ),
                Icon(Icons.done, color: ThemeStyle.iconColor, size: 54)
              ]),
              Text(resultHint, style: ThemeStyle.headline2)
            ],
          );
        case DialogState.waitingFuture:
          return const Center(
            child: CircularProgressIndicator(
              color: ThemeStyle.iconColor,
            ),
          );
      }
    });
  }
}
