class CurrentPageClass {
  final int currentPage;

  CurrentPageClass({required this.currentPage});

  CurrentPageClass copyWith({int? currentPage}) {
    return CurrentPageClass(currentPage: currentPage ?? this.currentPage);
  }
}
