import 'package:wan/app/data/repository/comments_entity.dart';

commentsEntityFromJson(CommentsEntity data, Map<String, dynamic> json) {
	if (json['curPage'] != null) {
		data.curPage = json['curPage'] is String
				? int.tryParse(json['curPage'])
				: json['curPage'].toInt();
	}
	if (json['datas'] != null) {
		data.datas = (json['datas'] as List).map((v) => CommentsDatas().fromJson(v)).toList();
	}
	if (json['offset'] != null) {
		data.offset = json['offset'] is String
				? int.tryParse(json['offset'])
				: json['offset'].toInt();
	}
	if (json['over'] != null) {
		data.over = json['over'];
	}
	if (json['pageCount'] != null) {
		data.pageCount = json['pageCount'] is String
				? int.tryParse(json['pageCount'])
				: json['pageCount'].toInt();
	}
	if (json['size'] != null) {
		data.size = json['size'] is String
				? int.tryParse(json['size'])
				: json['size'].toInt();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	return data;
}

Map<String, dynamic> commentsEntityToJson(CommentsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['curPage'] = entity.curPage;
	data['datas'] =  entity.datas?.map((v) => v.toJson())?.toList();
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}

commentsDatasFromJson(CommentsDatas data, Map<String, dynamic> json) {
	if (json['anonymous'] != null) {
		data.anonymous = json['anonymous'] is String
				? int.tryParse(json['anonymous'])
				: json['anonymous'].toInt();
	}
	if (json['appendForContent'] != null) {
		data.appendForContent = json['appendForContent'] is String
				? int.tryParse(json['appendForContent'])
				: json['appendForContent'].toInt();
	}
	if (json['articleId'] != null) {
		data.articleId = json['articleId'] is String
				? int.tryParse(json['articleId'])
				: json['articleId'].toInt();
	}
	if (json['canEdit'] != null) {
		data.canEdit = json['canEdit'];
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['contentMd'] != null) {
		data.contentMd = json['contentMd'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['niceDate'] != null) {
		data.niceDate = json['niceDate'].toString();
	}
	if (json['publishDate'] != null) {
		data.publishDate = json['publishDate'] is String
				? int.tryParse(json['publishDate'])
				: json['publishDate'].toInt();
	}
	if (json['replyCommentId'] != null) {
		data.replyCommentId = json['replyCommentId'] is String
				? int.tryParse(json['replyCommentId'])
				: json['replyCommentId'].toInt();
	}
	if (json['replyComments'] != null) {
		data.replyComments = (json['replyComments'] as List).map((v) => CommentsDatasReplyComments().fromJson(v)).toList();
	}
	if (json['rootCommentId'] != null) {
		data.rootCommentId = json['rootCommentId'] is String
				? int.tryParse(json['rootCommentId'])
				: json['rootCommentId'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['toUserId'] != null) {
		data.toUserId = json['toUserId'] is String
				? int.tryParse(json['toUserId'])
				: json['toUserId'].toInt();
	}
	if (json['toUserName'] != null) {
		data.toUserName = json['toUserName'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['userName'] != null) {
		data.userName = json['userName'].toString();
	}
	if (json['zan'] != null) {
		data.zan = json['zan'] is String
				? int.tryParse(json['zan'])
				: json['zan'].toInt();
	}
	return data;
}

Map<String, dynamic> commentsDatasToJson(CommentsDatas entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['anonymous'] = entity.anonymous;
	data['appendForContent'] = entity.appendForContent;
	data['articleId'] = entity.articleId;
	data['canEdit'] = entity.canEdit;
	data['content'] = entity.content;
	data['contentMd'] = entity.contentMd;
	data['id'] = entity.id;
	data['niceDate'] = entity.niceDate;
	data['publishDate'] = entity.publishDate;
	data['replyCommentId'] = entity.replyCommentId;
	data['replyComments'] =  entity.replyComments?.map((v) => v.toJson())?.toList();
	data['rootCommentId'] = entity.rootCommentId;
	data['status'] = entity.status;
	data['toUserId'] = entity.toUserId;
	data['toUserName'] = entity.toUserName;
	data['userId'] = entity.userId;
	data['userName'] = entity.userName;
	data['zan'] = entity.zan;
	return data;
}

commentsDatasReplyCommentsFromJson(CommentsDatasReplyComments data, Map<String, dynamic> json) {
	if (json['anonymous'] != null) {
		data.anonymous = json['anonymous'] is String
				? int.tryParse(json['anonymous'])
				: json['anonymous'].toInt();
	}
	if (json['appendForContent'] != null) {
		data.appendForContent = json['appendForContent'] is String
				? int.tryParse(json['appendForContent'])
				: json['appendForContent'].toInt();
	}
	if (json['articleId'] != null) {
		data.articleId = json['articleId'] is String
				? int.tryParse(json['articleId'])
				: json['articleId'].toInt();
	}
	if (json['canEdit'] != null) {
		data.canEdit = json['canEdit'];
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	if (json['contentMd'] != null) {
		data.contentMd = json['contentMd'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['niceDate'] != null) {
		data.niceDate = json['niceDate'].toString();
	}
	if (json['publishDate'] != null) {
		data.publishDate = json['publishDate'] is String
				? int.tryParse(json['publishDate'])
				: json['publishDate'].toInt();
	}
	if (json['replyCommentId'] != null) {
		data.replyCommentId = json['replyCommentId'] is String
				? int.tryParse(json['replyCommentId'])
				: json['replyCommentId'].toInt();
	}
	if (json['replyComments'] != null) {
		data.replyComments = (json['replyComments'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['rootCommentId'] != null) {
		data.rootCommentId = json['rootCommentId'] is String
				? int.tryParse(json['rootCommentId'])
				: json['rootCommentId'].toInt();
	}
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['toUserId'] != null) {
		data.toUserId = json['toUserId'] is String
				? int.tryParse(json['toUserId'])
				: json['toUserId'].toInt();
	}
	if (json['toUserName'] != null) {
		data.toUserName = json['toUserName'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'] is String
				? int.tryParse(json['userId'])
				: json['userId'].toInt();
	}
	if (json['userName'] != null) {
		data.userName = json['userName'].toString();
	}
	if (json['zan'] != null) {
		data.zan = json['zan'] is String
				? int.tryParse(json['zan'])
				: json['zan'].toInt();
	}
	return data;
}

Map<String, dynamic> commentsDatasReplyCommentsToJson(CommentsDatasReplyComments entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['anonymous'] = entity.anonymous;
	data['appendForContent'] = entity.appendForContent;
	data['articleId'] = entity.articleId;
	data['canEdit'] = entity.canEdit;
	data['content'] = entity.content;
	data['contentMd'] = entity.contentMd;
	data['id'] = entity.id;
	data['niceDate'] = entity.niceDate;
	data['publishDate'] = entity.publishDate;
	data['replyCommentId'] = entity.replyCommentId;
	data['replyComments'] = entity.replyComments;
	data['rootCommentId'] = entity.rootCommentId;
	data['status'] = entity.status;
	data['toUserId'] = entity.toUserId;
	data['toUserName'] = entity.toUserName;
	data['userId'] = entity.userId;
	data['userName'] = entity.userName;
	data['zan'] = entity.zan;
	return data;
}