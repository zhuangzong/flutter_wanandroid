import 'package:wan/app/data/repository/userinfo_entity.dart';

userinfoEntityFromJson(UserinfoEntity data, Map<String, dynamic> json) {
	if (json['coinInfo'] != null) {
		data.coinInfo = UserinfoCoinInfo().fromJson(json['coinInfo']);
	}
	if (json['userInfo'] != null) {
		data.userInfo = UserinfoUserInfo().fromJson(json['userInfo']);
	}
	return data;
}

Map<String, dynamic> userinfoEntityToJson(UserinfoEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['coinInfo'] = entity.coinInfo?.toJson();
	data['userInfo'] = entity.userInfo?.toJson();
	return data;
}

userinfoCoinInfoFromJson(UserinfoCoinInfo data, Map<String, dynamic> json) {
	if (json['coinCount'] != null) {
		data.coinCount = json['coinCount'] is String
				? int.tryParse(json['coinCount'])
				: json['coinCount'].toInt();
	}
	if (json['level'] != null) {
		data.level = json['level'] is String
				? int.tryParse(json['level'])
				: json['level'].toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['rank'] != null) {
		data.rank = json['rank'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	return data;
}

Map<String, dynamic> userinfoCoinInfoToJson(UserinfoCoinInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['coinCount'] = entity.coinCount;
	data['level'] = entity.level;
	data['nickname'] = entity.nickname;
	data['rank'] = entity.rank;
	data['userId'] = entity.userId;
	data['username'] = entity.username;
	return data;
}

userinfoUserInfoFromJson(UserinfoUserInfo data, Map<String, dynamic> json) {
	if (json['admin'] != null) {
		data.admin = json['admin'];
	}
	if (json['chapterTops'] != null) {
		data.chapterTops = (json['chapterTops'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['coinCount'] != null) {
		data.coinCount = json['coinCount'] is String
				? int.tryParse(json['coinCount'])
				: json['coinCount'].toInt();
	}
	if (json['collectIds'] != null) {
		data.collectIds = (json['collectIds'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['password'] != null) {
		data.password = json['password'].toString();
	}
	if (json['publicName'] != null) {
		data.publicName = json['publicName'].toString();
	}
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	return data;
}

Map<String, dynamic> userinfoUserInfoToJson(UserinfoUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['admin'] = entity.admin;
	data['chapterTops'] = entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] = entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}