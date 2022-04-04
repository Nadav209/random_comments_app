class LazyLoadingFilter {
  int? page;
  int? limit;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LazyLoadingFilter && o.page == page && o.limit == limit;
  }

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;

  @override
  String toString() => 'LazyLoadingFilter(page:$page,limit:$limit)';
}
