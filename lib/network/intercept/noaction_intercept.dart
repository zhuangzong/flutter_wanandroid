

import 'package:flutter/cupertino.dart';

import 'base_intercept.dart';

class NoActionIntercept extends BaseIntercept {
  NoActionIntercept(BuildContext context, {bool isDefaultFailure = true}) {
    this.context = context;
    this.isDefaultFailure = isDefaultFailure;
  }
  @override
  void afterRequest() {
  }

  @override
  void beforeRequest() {
  }
}
