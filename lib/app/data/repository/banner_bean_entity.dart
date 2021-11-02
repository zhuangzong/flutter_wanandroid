import 'package:wan/generated/json/base/json_convert_content.dart';

class BannerBeanEntity with JsonConvert<BannerBeanEntity> {
	late String desc;
	late int id;
	late String imagePath;
	late int isVisible;
	late int order;
	late String title;
	late int type;
	late String url;
}
