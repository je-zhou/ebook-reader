class FilterSettings {
  FilterSettings();
// There can only be one Sort Filter at a time
  SortFilter? sortFilter;
  // Can have multiple Status Filters
  // Initial filter is reading desc
  List<StatusFilters> statusFilters = [StatusFilters.readingDesc];
  // Can have multiple File Type Filters
  List<FileTypeFilters> fileTypeFilters = [];
}

enum SortFilter { byTitleAsc, byTitleDesc, byAuthorAsc, byAuthDesc, none }

enum StatusFilters {
  readingAsc,
  readingDesc,
  unread,
  completed,
  none,
}

enum FileTypeFilters {
  epub,
  pdf,
  none,
}
