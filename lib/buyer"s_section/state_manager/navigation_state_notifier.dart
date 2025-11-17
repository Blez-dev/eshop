import 'package:eshop/buyer%22s_section/models/current_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class NavigationState extends StateNotifier<CurrentPageClass>{
  NavigationState(): super(CurrentPageClass(currentPage: 0));

  void setIndex(int currentPageNumber){
state=state.copyWith(currentPage: currentPageNumber);
  }
}

final currentPageProvider= StateNotifierProvider<NavigationState,CurrentPageClass>((ref){
  return NavigationState();
});