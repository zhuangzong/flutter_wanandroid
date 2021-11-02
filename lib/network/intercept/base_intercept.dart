

import 'package:flutter/cupertino.dart';
import 'package:wan/app/utils/ui_utils.dart';

/**
 * 这个是一个自定义的 ， 处理 请求前、请求后，对话框的一些配置等自动处理类，只需传入
 * BaseWidget 中的父类 BaseFuntion 即可
 */
abstract class BaseIntercept {
  bool isDefaultFailure = true;
  BuildContext? context;
  void beforeRequest();
  void afterRequest();
  void requestFailure(String? content) {
    //默认请求出错的处理，可以通过设置 isDefaultFailure 来控制
    if (isDefaultFailure) {
      if (content!.isNotEmpty) {
        UIUtils.showMessageDialog(context!,content);
      }
    }
  }

}
