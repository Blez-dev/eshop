class SavedAdStateClass {
  final bool isSaved;
  final bool isDoneSaving;
  final bool isLoading;

  const SavedAdStateClass({
    required this.isSaved,
    required this.isDoneSaving,
    required this.isLoading
  });

  SavedAdStateClass copyWith({
    bool? isSaved,
    bool? isDoneSaving,
    bool? isLoading,
  }) {
    return SavedAdStateClass(
      isSaved: isSaved ?? this.isSaved,
      isDoneSaving: isDoneSaving ?? this.isDoneSaving,
      isLoading: isLoading?? this.isLoading,
    );
  }
}
