class SavedPhoneClass {
  final bool isSaved;
  final bool isDeleting;

  SavedPhoneClass({
    this.isSaved = false,
    this.isDeleting=false,
  });

  SavedPhoneClass copyWith({
    bool? isSaved,
    bool? isDeleting,
  }) {
    return SavedPhoneClass(
      isSaved: isSaved ?? this.isSaved,
      isDeleting: isDeleting?? this.isDeleting
    );
  }
}
