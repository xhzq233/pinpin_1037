/// pinpin_1037 - validators
/// Created by xhz on 2022/1/17.


class Validators {
  static String? schoolNumber(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return "学号不能为空";
    } else if (str.startsWith(RegExp("[Uu]"))) {
      final num = int.tryParse(str.substring(1));
      if (num != null && 201600000 < num && num < 202140000) {
        return null;
      } else {
        return "学号格式错误";
      }
    } else {
      return "学号应以u开头";
    }
  }

  static String? passwd(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return "密码不能为空";
    } else if (!RegExp('[A-Za-z0-9]{6,16}').hasMatch(str)) {
      return '密码不合规范，需6-16个字符且仅含英文与数字';
    } else {
      return null;
    }
  }

  static String? usrName(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return "用户名不能为空";
    } else {
      return null;
    }
  }

  static String? qqNumber(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return null;
    }
    final qqReg = RegExp("[1-9]\\d{4,10}");
    if (!qqReg.hasMatch(str)) {
      return 'QQ号码格式不符！';
    }
    return null;
  }

  static String? telNumber(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return null;
    }
    final telReg = RegExp("1[34578]\\d{9}");
    if (!telReg.hasMatch(str)) {
      return '电话号码格式不符！';
    }
  }

  static String? vxNumber(String? v) {
    final str = v!.trim();
    if (str.isEmpty) {
      return null;
    }
    final vxReg = RegExp("[a-zA-Z][a-zA-Z\\d_-]{5,19}");
    if (!vxReg.hasMatch(str)) {
      return '微信号格式不符！';
    }
  }

  static String? code(String? v) {
    final str = v!.trim();
    final codeReg = RegExp("\\d{6}");
    if (!codeReg.hasMatch(str)) {
      return '应为6位数字!';
    }
  }

  static bool isInt(String? s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
