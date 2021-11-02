

import 'package:flutter/cupertino.dart';
import 'package:wan/app/utils/ui_utils.dart';

import 'base_intercept.dart';

class ShowLoadingIntercept extends BaseIntercept {
  ShowLoadingIntercept(BuildContext context,
      {bool isDefaultFailure = true}) {
    this.context = context;
    this.isDefaultFailure = isDefaultFailure;
  }
  @override
  void afterRequest() {
    if (context != null) {
      UIUtils.dismissProgressDialog();
    }
  }

  @override
  void beforeRequest() {
    if (context != null) {
      UIUtils.showProgressDialog(context!);
    }
  }
}
