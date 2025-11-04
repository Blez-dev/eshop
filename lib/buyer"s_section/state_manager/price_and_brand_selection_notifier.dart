import 'package:eshop/buyer%22s_section/models/price_and_brand_selection.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:flutter_riverpod/legacy.dart';

class PandBNotifier extends StateNotifier<PriceAndBrandSelection> {
  PandBNotifier()
    : super(PriceAndBrandSelection(priceFlag: null, brandPickedStatus: null));

  //function to set brand
  void setBrandStatus(String brand) {
    final initialBrandName = state.brandPickedStatus ?? "";

    String trimmed = brand.trim();

    final isAlphabetOnly = RegExp(
      r'^[a-zA-Z]+$',
    ).hasMatch(trimmed.replaceAll(' ', ''));

    if (isAlphabetOnly) {
      // Make first letter uppercase, rest lowercase
      String formatted =
          trimmed[0].toUpperCase() + trimmed.substring(1).toLowerCase();
      state = state.copyWith(brandPickedStatus: formatted);
    } else {
    if(brand.isEmpty){
      state = state.copyWith(brandPickedStatus: "");

    }else{
      SecondToastHelper.error("Enter a well formatted search");
    }
    }
  }

  //write the methods below for the brands
  void applePicked() {
    if (state.brandPickedStatus == "Apple") {
      state = state.copyWith(brandPickedStatus: "");
    } else {
      state = state.copyWith(brandPickedStatus: "Apple");
    }
  }

  void samsungPicked() {
    if (state.brandPickedStatus == "Samsung") {
      state = state.copyWith(brandPickedStatus: "");
    } else {
      state = state.copyWith(brandPickedStatus: "Samsung");
    }
  }

  void technoPicked() {
    if (state.brandPickedStatus == "Techno") {
      state = state.copyWith(brandPickedStatus: "");
    } else {
      state = state.copyWith(brandPickedStatus: "Techno");
    }
  }

  void xiaomiPicked() {
    if (state.brandPickedStatus == "Xiaomi") {
      state = state.copyWith(brandPickedStatus: "");
    } else {
      state = state.copyWith(brandPickedStatus: "Xiaomi");
    }
  }

  void infinixPicked() {
    if (state.brandPickedStatus == "Infinix") {
      state = state.copyWith(brandPickedStatus: "");
    } else {
      state = state.copyWith(brandPickedStatus: "Infinix");
    }
  }

  //method for prices
  void lessThan100() {
    if (state.priceFlag == 100000) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 100000);
    }
  }

  void lessThan400() {
    if (state.priceFlag == 400000) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 400000);
    }
  }

  void lessThan700() {
    if (state.priceFlag == 700000) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 700000);
    }
  }

  void lessThan1M() {
    if (state.priceFlag == 1000000) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 1000000);
    }
  }

  void lessThanOnePoint5M() {
    if (state.priceFlag == 1500000) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 1500000);
    }
  }

  void onePoint5MAbove() {
    if (state.priceFlag == 1500001) {
      state = state.copyWith(priceFlag: 0);
    } else {
      state = state.copyWith(priceFlag: 1500001);
    }
  }
}

final priceAndBrandProvider =
    StateNotifierProvider<PandBNotifier, PriceAndBrandSelection>((ref) {
      return PandBNotifier();
    });
