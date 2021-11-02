import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan/app/data/repository/userinfo_entity.dart';
import 'package:wan/app/routes/app_pages.dart';
import 'package:wan/app/utils/requestUtil.dart';
import 'package:wan/app/utils/ui_utils.dart';
import 'package:wan/network/bean/result_entity.dart';
import 'package:wan/widget/anim_login_widget.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class PersonController extends GetxController {


  var userName = "去登陆".obs;
  var level = 0.obs;
  var rank = "".obs;
  bool isLogin = false;

  Future<void> headTap() async {
    isLogin = await Get.toNamed(Routes.LOGIN);
    if(isLogin){
      getUserInfo();
    }

    // Navigator.of(Get.context!).push(MaterialPageRoute(builder: (_){
    //   return AnimLogin();
    // }));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
      isLogin = UIUtils.isLogin();
      if(isLogin) {
        getUserInfo();
      }
  }


  void getUserInfo() async{
    ResultEntity resultEntity = await RequestUtils.userinfo();
    if(resultEntity.errorCode==0){
      UserinfoEntity userEntity = UserinfoEntity().fromJson(resultEntity.data);
      userName.value = userEntity.userInfo!.username!;
      level.value = userEntity.coinInfo!.level!;
      rank.value = userEntity.coinInfo!.rank!;
      refresh();
    }
  }

}
