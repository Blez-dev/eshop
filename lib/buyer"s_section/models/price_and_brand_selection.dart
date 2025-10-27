class PriceAndBrandSelection {
  final int? priceFlag;
  final String? brandPickedStatus;

  PriceAndBrandSelection({this.priceFlag, this.brandPickedStatus});

  // ✅ copyWith method
  PriceAndBrandSelection copyWith({
    int? priceFlag,
    String? brandPickedStatus,
  }) {
    return PriceAndBrandSelection(
      priceFlag: priceFlag ?? this.priceFlag,
      brandPickedStatus: brandPickedStatus ?? this.brandPickedStatus,
    );
  }
}
