import 'package:wan/generated/json/base/json_convert_content.dart';

class MainTopListEntity with JsonConvert<MainTopListEntity> {
	String? apkLink;
	int? audit;
	String? author;
	bool? canEdit;
	int? chapterId;
	String? chapterName;
	bool? collect;
	int? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	int? id;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	int? publishTime;
	int? realSuperChapterId;
	int? selfVisible;
	int? shareDate;
	String? shareUser;
	int? superChapterId;
	String? superChapterName;
	List<MainTopListTags>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
}

class MainTopListTags with JsonConvert<MainTopListTags> {
	String? name;
	String? url;
}
