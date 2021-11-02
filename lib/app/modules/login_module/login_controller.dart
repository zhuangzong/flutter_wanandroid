import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/user_entity.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/app/utils/sp_utils.dart';
import 'package:wan/network/bean/result_entity.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController {
  PageController pageController = PageController();
  var pageType = 0.obs;
  var loginName = TextEditingController(text: "wangba").obs;
  var password = TextEditingController(text: "123456").obs;
  var repassword = TextEditingController().obs;

  void onUsernameChanged(String username) {
    loginName.value.text = username;
    loginName.value.selection = TextSelection.fromPosition(TextPosition(
      affinity: TextAffinity.downstream,
      offset: username.length,
    ));
  }

  void onPasswordChanged(String _password) {
    password.value.text = _password;
    password.value.selection = TextSelection.fromPosition(TextPosition(
      affinity: TextAffinity.downstream,
      offset: _password.length,
    ));
  }
  void onRePasswordChanged(String _password) {
    repassword.value.text = _password;
    repassword.value.selection = TextSelection.fromPosition(TextPosition(
      affinity: TextAffinity.downstream,
      offset: _password.length,
    ));
  }

  void onUsernameClear() {
    loginName.value.clear();
  }

  void onPasswordClear() {
    password.value.clear();
  }
  void onRePasswordClear() {
    repassword.value.clear();
  }

  void login() async {
    Map<String, dynamic> map = {
      "username": loginName.value.text,
      "password": password.value.text
    };
    ResultEntity resultEntity = await RequestUtils.login(map);
    UserEntity entity = UserEntity().fromJson(resultEntity.data);
    entity.password = password.value.text;
    SpUtils.putBool("isLogin", true);
    Fluttertoast.showToast(msg: "登录成功");
    Get.back(result: true);
  }

  void register() async {
    Map<String, dynamic> map = {
      "username": loginName.value.text,
      "password": password.value.text,
      "repassword": repassword.value.text,
    };
    ResultEntity resultEntity = await RequestUtils.register(map);
    UserEntity entity = UserEntity().fromJson(resultEntity.data);
    entity.password = password.value.text;
    SpUtils.putObject("user", entity);
    SpUtils.putBool("isLogin", true);
    Fluttertoast.showToast(msg: "注册成功");
    Get.back(result: true);
  }
}
