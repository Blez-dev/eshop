import 'package:eshop/vendor_directory/model/sizes_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class SizesNotifier extends StateNotifier<Sizes> {
  SizesNotifier()
    : super(Sizes(s: false, m: false, l: false, xs: false, xl: false));

  void toggleS() {
    state = state.copyWith(s: !state.s);
  }

  void toggleM() {
    state = state.copyWith(m: !state.m);
  }

  void toggleL() {
    state = state.copyWith(l: !state.l);
  }

  void toggleXS() {
    state = state.copyWith(xs: !state.xs);
  }

  void toggleXL() {
    state = state.copyWith(xl: !state.xl);
  }
}

final sizesProvider = StateNotifierProvider<SizesNotifier, Sizes>((ref) {
  return SizesNotifier();
});
