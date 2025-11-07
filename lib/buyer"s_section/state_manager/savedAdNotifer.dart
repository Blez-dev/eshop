import 'package:eshop/buyer%22s_section/models/savedAdClass.dart';
import 'package:eshop/buyer%22s_section/models/saved_ad_state_class.dart';
import 'package:eshop/buyer%22s_section/services/save_ad_repository.dart';
import 'package:flutter_riverpod/legacy.dart';

class SavedAdNotifier extends StateNotifier<SavedAdStateClass> {
  final SaveAdRepo saveAdRepo;

  SavedAdNotifier(this.saveAdRepo)
    : super(SavedAdStateClass(isSaved: false, isDoneSaving: false,isLoading: false));

  Future<void> saveAd(
   SavedAd newAd
  ) async {
    await saveAdRepo.saveAdItem(newAd);
    state=state.copyWith(isSaved: true);
  }

  //toggle idLoading on
  void isLoading (){
    state= state.copyWith(isLoading: true);
  }
  void isSavedTrue(){


    state=state.copyWith(isSaved: true);

  }

void isDetailsSavingPositive(){
    state=state.copyWith(detailsIsSaving: true);
}

  void isDetailsSavingNegative(){
    state=state.copyWith(detailsIsSaving: false);
  }

  void isSavedFalse(){
    state=state.copyWith(isSaved: false);

  }

  Future<void> deleteAd(String docId) async{
    await saveAdRepo.deleteAdItem(docId);
    state=state.copyWith(isSaved: false);
  }
  Future<List<SavedAd>> loadAds() async{
    final List<SavedAd> ads= await saveAdRepo.loadSavedAds();
    return ads;
  }



}

final savedAdNotifierProvider = StateNotifierProvider((ref) {
  final adProviderRepo = ref.read(savedAdProvider);
  return SavedAdNotifier(adProviderRepo);
});
