sealed class FilterDrawerEvent {
  const FilterDrawerEvent();
}

class FilterDrawerEventTagQueryChanged extends FilterDrawerEvent {
  final String tagQuery;

  const FilterDrawerEventTagQueryChanged({required this.tagQuery});
}
