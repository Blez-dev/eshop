import 'package:eshop/buyer%22s_section/models/saved_phone_model.dart';
import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:flutter_riverpod/legacy.dart';

class SavedNotifier extends StateNotifier<SavedPhoneClass> {
  BuyersDatabase buyersDatabase;

  SavedNotifier(this.buyersDatabase) : super(SavedPhoneClass());

  Future<void> deleteFromAllUser(String docId, String buyerID) async {
    state = state.copyWith(isDeleting: true);
    await buyersDatabase.deleteSavedDoc(docId, buyerID);
    state = state.copyWith(isDeleting: false);
    SecondToastHelper.error("AD deleted from 'saved' sucessfully");
  }
}


final buyersStateProvider = StateNotifierProvider<SavedNotifier,SavedPhoneClass>((ref){
  final buyersDatabase= ref.read(buyersDatabaseProvider);
  return SavedNotifier(buyersDatabase);
});