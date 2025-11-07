class SavedAdStateClass {
  final bool isSaved;
  final bool isDoneSaving;
  final bool isLoading;
  final bool detailsIsSaving;

  const SavedAdStateClass({
    required this.isSaved,
    required this.isDoneSaving,
    required this.isLoading,
    this.detailsIsSaving = false, // ✅ added default
  });

  SavedAdStateClass copyWith({
    bool? isSaved,
    bool? isDoneSaving,
    bool? isLoading,
    bool? detailsIsSaving, // ✅ added here
  }) {
    return SavedAdStateClass(
      isSaved: isSaved ?? this.isSaved,
      isDoneSaving: isDoneSaving ?? this.isDoneSaving,
      isLoading: isLoading ?? this.isLoading,
      detailsIsSaving: detailsIsSaving ?? this.detailsIsSaving, // ✅ added here
    );
  }
}
