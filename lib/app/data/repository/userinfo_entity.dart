import 'package:wan/generated/json/base/json_convert_content.dart';

class UserinfoEntity with JsonConvert<UserinfoEntity> {
	UserinfoCoinInfo? coinInfo;
	UserinfoUserInfo? userInfo;
}

class UserinfoCoinInfo with JsonConvert<UserinfoCoinInfo> {
	int? coinCount;
	int? level;
	String? nickname;
	String? rank;
	int? userId;
	String? username;
}

class UserinfoUserInfo with JsonConvert<UserinfoUserInfo> {
	bool? admin;
	List<dynamic>? chapterTops;
	int? coinCount;
	List<dynamic>? collectIds;
	String? email;
	String? icon;
	int? id;
	String? nickname;
	String? password;
	String? publicName;
	String? token;
	int? type;
	String? username;
}
