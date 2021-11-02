import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/sp_utils.dart';
import 'package:wan/widget/message_dialog.dart';
import 'package:wan/widget/progress.dart';
import 'package:wan/widget/single_choice_widget.dart';

import 'strings.dart';

class UIUtils {
  static NetLoadingDialog? netLoadingDialog;
  static BuildContext? dialogContext;

  static void showProgressDialog(BuildContext context,
      {String loadingText = Loading}) {
    netLoadingDialog = NetLoadingDialog(
      loadingText: Loading,
      outsideDismiss: false,
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          dialogContext = context;
          return netLoadingDialog!;
        });
  }

  static void dismissProgressDialog() {
    if (netLoadingDialog != null) {
      Navigator.pop(dialogContext!);
    }
  }

  ///没有登录的去登录
  static bool isLoginToLogin(){
    bool isLogin = SpUtils.getBool("isLogin");
    if(!isLogin){
      Get.toNamed(Routes.LOGIN);
    }
    return isLogin;
  }
  static bool isLogin(){
    return SpUtils.getBool("isLogin");
  }

  ///弹对话框
  static void showMessageDialog(BuildContext context, String message,
      {String title = "提示",
      String? negativeText,
      positiveText = "确定",
      Function()? callBack}) {
    if (message.isNotEmpty) {
      showDialog<void>(
          context: context, //BuildContext对象
          barrierDismissible: false,
          builder: (BuildContext context) {
            return MessageDialog(
              title: title,
              negativeText: negativeText,
              positiveText: positiveText,
              message: message,
              onCloseEvent: () {
                Navigator.pop(context);
              },
              onPositivePressEvent: () {
                Navigator.pop(context);
                if(callBack!=null){
                  callBack();
                }
              },
            );
            //调用对话框);
          });
    }
  }

}
