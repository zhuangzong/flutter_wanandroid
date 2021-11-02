import 'package:wan/generated/json/base/json_convert_content.dart';

class CommentsEntity with JsonConvert<CommentsEntity> {
	int? curPage;
	List<CommentsDatas>? datas;
	int? offset;
	bool? over;
	int? pageCount;
	int? size;
	int? total;
}

class CommentsDatas with JsonConvert<CommentsDatas> {
	int? anonymous;
	int? appendForContent;
	int? articleId;
	bool? canEdit;
	String? content;
	String? contentMd;
	int? id;
	String? niceDate;
	int? publishDate;
	int? replyCommentId;
	List<CommentsDatasReplyComments>? replyComments;
	int? rootCommentId;
	int? status;
	int? toUserId;
	String? toUserName;
	int? userId;
	String? userName;
	int? zan;
}

class CommentsDatasReplyComments with JsonConvert<CommentsDatasReplyComments> {
	int? anonymous;
	int? appendForContent;
	int? articleId;
	bool? canEdit;
	String? content;
	String? contentMd;
	int? id;
	String? niceDate;
	int? publishDate;
	int? replyCommentId;
	List<dynamic>? replyComments;
	int? rootCommentId;
	int? status;
	int? toUserId;
	String? toUserName;
	int? userId;
	String? userName;
	int? zan;
}
