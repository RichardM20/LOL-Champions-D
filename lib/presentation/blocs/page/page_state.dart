class PageViewState {
  double? page;
  PageViewState({this.page});
  PageViewState copyWith({double? page}) =>
      PageViewState(page: page ?? this.page);
}
