import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:random_comments_app/core/model/comments_model.dart';
import 'package:random_comments_app/core/model/lazy_loading_filter.dart';
import 'package:random_comments_app/data/service/comments_repo.dart';
class ListingController extends GetxController {
  final _comments = <CommentsModel>[].obs;
  final _paginationFilter = LazyLoadingFilter().obs;
  final _lastPage = false.obs;

  List<CommentsModel> get comments => _comments.toList();

  int get limit => _paginationFilter.value.limit!;

  int get _page => _paginationFilter.value.page!;

  bool get lastPage => _lastPage.value;

  @override
  void onInit() {
    _getAllComments();
    changePaginationFilter(0, 20);
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void onReady() {}

  Future<void> _getAllComments() async {
    final commentsData =
        await CommentsRepository(Dio()).getComments(_paginationFilter.value);
    if (commentsData.isEmpty) {
      _lastPage.value = true;
    }
    _comments.addAll(commentsData);
  }

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void changeTotalPerPage(int limitval) {
    _comments.clear();
    _lastPage.value = false;
    changePaginationFilter(1, limitval);
  }

  void loadNextPage() async {
    changePaginationFilter(_page + 20, limit + 20);
    await _getAllComments();
  }
}
