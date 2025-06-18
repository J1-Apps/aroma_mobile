sealed class FilterDrawerEvent {
  const FilterDrawerEvent();
}

class FilterDrawerTagQueryChanged extends FilterDrawerEvent {
  final String tagQuery;

  const FilterDrawerTagQueryChanged({required this.tagQuery});
}
