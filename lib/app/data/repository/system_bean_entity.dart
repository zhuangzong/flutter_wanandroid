import 'package:wan/generated/json/base/json_convert_content.dart';

class SystemBeanEntity with JsonConvert<SystemBeanEntity> {
	List<SystemBeanChildren>? children;
	int? courseId;
	int? id;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
}

class SystemBeanChildren with JsonConvert<SystemBeanChildren> {
	List<dynamic>? children;
	int? courseId;
	int? id;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
}
