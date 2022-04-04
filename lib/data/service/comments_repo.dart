import 'package:dio/dio.dart';
import 'package:random_comments_app/core/constant.dart';
import 'package:random_comments_app/core/model/comments_model.dart';
import 'package:random_comments_app/core/model/lazy_loading_filter.dart';


class CommentsRepository {
  Dio? _dio;

  CommentsRepository(this._dio);

  Future<List<CommentsModel>> getComments(LazyLoadingFilter filter) {
    return _dio!.get('${host}', queryParameters: {
      '_start': filter.page,
      '_end': filter.limit
    }).then((value) => value.data
        ?.map<CommentsModel>((u) => CommentsModel.fromJson(u))
        ?.toList());
  }
}
