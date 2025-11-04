import 'dart:convert';

import 'package:eshop/buyer%22s_section/models/savedAdClass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveAdRepo {


  Future<void> saveAdItem(SavedAd newAd) async {
    final prefs = await SharedPreferences.getInstance();
    // Get the existing list (as a JSON string)
    final String? existingAdsJson = prefs.getString('saved_ads');
    // Decode existing list or start empty
    List<dynamic> adsList = existingAdsJson != null ? jsonDecode(
        existingAdsJson) : [];
    // Add the new ad
    adsList.add(newAd.toMap());
    // Save back as JSON string
    await prefs.setString('saved_ads', jsonEncode(adsList));
  }


  Future<void> deleteAdItem(String docId) async {
    final prefs = await SharedPreferences.getInstance();
    // Get the saved ads
    final String? existingAdsJson = prefs.getString('saved_ads');
    if (existingAdsJson == null) return; // nothing to delete
    // Decode the JSON into a list of SavedAd objects
    List<dynamic> adsList = jsonDecode(existingAdsJson);
    // Convert each map to a SavedAd object
    List<SavedAd> savedAds =
    adsList.map((item) => SavedAd.fromMap(item)).toList();
    // Filter out the ad with the matching docId
    savedAds.removeWhere((ad) => ad.docId == docId);
    // Encode the updated list back to JSON and save
    await prefs.setString(
      'saved_ads',
      jsonEncode(savedAds.map((ad) => ad.toMap()).toList()),
    );
  }

  Future<List<SavedAd>> loadSavedAds() async {
    final prefs = await SharedPreferences.getInstance();
    final String? adsJson = prefs.getString('saved_ads');

    if (adsJson == null) return [];

    List<dynamic> decoded = jsonDecode(adsJson);
    return decoded.map((item) => SavedAd.fromMap(item)).toList();
  }
}

  final savedAdProvider = Provider((ref) {
    return SaveAdRepo();
  });
