import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/utils/validators.dart';

class PostPinPinLogic extends GetxController {
  var showDate = false;

  final List<Validator> validators = [];

  static const qqVali = Validators.qqNumber;
  static const vxVali = Validators.vxNumber;
  static const telVali = Validators.telNumber;
  static const numVali = Validators.isInt;
  static const isNotEmptyVali = Validators.isNotEmpty;
  final PageController controller = PageController();

  var tabIndex = 0;
  var selectedGender = 0;

  // ///TODO:懒加载
  // final contestNameController = TextEditingController();
  // final num1Controller = TextEditingController();
  // final num2Controller = TextEditingController();
  // final leaderDepartmentController = TextEditingController();
  // final infoDemandedController = TextEditingController();
  // final qqController = TextEditingController();
  // final vxController = TextEditingController();
  // final telController = TextEditingController();
  // final leaderNameController = TextEditingController();
  // final teamMateInfoController = TextEditingController();
  // final contestInfoController = TextEditingController();
  // final leaderInfoController = TextEditingController();
  final progress1 = [false, false, false];
  final progress2 = [false, false];

  String contestName = '';
  String num1 = '';
  String num2 = '';
  String leaderDepartment = '';
  String infoDemanded = '';
  String qq = '';
  String vx = '';
  String tel = '';
  String leaderName = '';
  String teamMateInfo = '';
  String contestInfo = '';
  String leaderInfo = '';

  DateTime selectedDate = DateTime.now();

  bool _decideWhichDayToEnable(DateTime day) {
    if (day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 30)))) {
      return true;
    }
    return false;
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2024),
        selectableDayPredicate: _decideWhichDayToEnable);
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      showDate = true;
      update();
    }
  }

  PinPinDataSource get dataWaitedForPost => PinPinDataSource(
        demandingIntroduction: infoDemanded,
        contactQq: qq,
        contactWechat: vx,
        contactTel: tel,
        masterName: leaderName,
        masterIntroduction: leaderInfo,
        masterSex: selectedGender == 0
            ? ''
            : selectedGender == 1
                ? '男'
                : '女',
        masterGradeandmajor: leaderDepartment,
        competitionIntroduction: contestInfo,
        teammateIntroduction: teamMateInfo,
        deadline: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    TimeOfDay.now().hour,
                    TimeOfDay.now().minute)
                .toIso8601String() +
            'Z',
        title: contestName,
        nowNum: int.parse(num2),
        demandingNum: int.parse(num1),
      );

  void animateTo(int index) {
    if (index == tabIndex) return;
    controller.jumpToPage(index);
  }

  void onTabChange(int index) {
    tabIndex = index;
    update();
  }

  void updateProgress1() {
    progress1[0] = qqVali(qq).isEmpty ||
        vxVali(vx).isEmpty ||
        telVali(tel).isEmpty ||
        qq.isNotEmpty ||
        vx.isNotEmpty ||
        tel.isNotEmpty;

    progress1[1] = contestName.isNotEmpty;
    progress1[2] = showDate;
  }

  void updateProgress2() {
    progress2[0] =
        numVali(num1) || numVali(num2) || int.parse(num1) > int.parse(num2);
    progress2[1] = infoDemanded.isNotEmpty;
  }
}
