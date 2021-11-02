class ResultEntity {
  int? errorCode;
  String? errorMsg;
  dynamic data;

  ResultEntity(
      {this.errorCode,
      this.errorMsg,
      this.data});

  ResultEntity.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

