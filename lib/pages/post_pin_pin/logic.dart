import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpin_1037/models/pin_pin_data_source/pin_pin_data_source.dart';
import 'package:pinpin_1037/utils/validators.dart';

class PostPinPinLogic extends GetxController {
  var showDate = false;

  final List<Validator> validators = [];

  var tabIndex = 0;
  var selectedGender = 0;

  ///TODO:懒加载
  final contestNameController = TextEditingController();
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final leaderDepartmentController = TextEditingController();
  final infoDemandedController = TextEditingController();
  final qqController = TextEditingController();
  final vxController = TextEditingController();
  final telController = TextEditingController();
  final leaderNameController = TextEditingController();
  final teamMateInfoController = TextEditingController();
  final contestInfoController = TextEditingController();
  final leaderInfoController = TextEditingController();

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
        // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        selectableDayPredicate: _decideWhichDayToEnable);
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      showDate = true;
      update();
    }
  }

  PinPinDataSource get dataWaitedForPost => PinPinDataSource(
        demandingIntroduction: infoDemandedController.text,
        contactQq: qqController.text,
        contactWechat: vxController.text,
        contactTel: telController.text,
        masterName: leaderNameController.text,
        masterIntroduction: leaderInfoController.text,
        masterSex: selectedGender == 0
            ? ''
            : selectedGender == 1
                ? '男'
                : '女',
        masterGradeandmajor: leaderDepartmentController.text,
        competitionIntroduction: contestInfoController.text,
        teammateIntroduction: teamMateInfoController.text,
        deadline: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    TimeOfDay.now().hour,
                    TimeOfDay.now().minute)
                .toIso8601String() +
            'Z',
        title: contestNameController.text,
        nowNum: int.parse(num2Controller.text),
        demandingNum: int.parse(num1Controller.text),
      );
}
