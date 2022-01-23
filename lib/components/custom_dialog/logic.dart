import 'package:get/get.dart';

enum DialogState { waitingConfirm, waitingFuture, complete }

class CustomDialogLogic<T> extends GetxController {
  T data;
  final Future<void> Function(T) future;

  CustomDialogLogic({required this.future, required this.data});

  DialogState state = DialogState.waitingConfirm;

  void confirm() async {
    state = DialogState.waitingFuture;
    update();
    await future(data);
    state = DialogState.complete;
    update();
    Future.delayed(const Duration(seconds: 1, milliseconds: 500)).then((_) {
      Get.back();
    });
  }
}
