import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class BuyersDatabase {
  final CollectionReference marketRef = FirebaseFirestore.instance.collection(
    "market",
  );

  //get phone items

  Stream<QuerySnapshot> getPhoneItems() {
    return marketRef.snapshots();
  }

  //get items dynamically
  Stream<QuerySnapshot> getPhoneItemsByBrandAndPrice(
    int priceSelection,
    String brandSelection,
  ) {
    if (!(priceSelection == 0) && brandSelection.isNotEmpty) {
      // a nested if for price here
      if (priceSelection == 1500001) {
        return marketRef
            .where("intPrice", isGreaterThanOrEqualTo: priceSelection)
            .where("brand", isEqualTo: brandSelection)
            .snapshots();
      } else {
        return marketRef
            .where("intPrice", isLessThanOrEqualTo: priceSelection)
            .where("brand", isEqualTo: brandSelection)
            .snapshots();
      }
    } else if (brandSelection.isNotEmpty && priceSelection == 0) {
      return marketRef.where("brand", isEqualTo: brandSelection).snapshots();
    } else if (!(priceSelection == 0) && brandSelection.isEmpty) {
      if (priceSelection == 1500001) {
        return marketRef
            .where("intPrice", isGreaterThanOrEqualTo: priceSelection)
            .snapshots();
      } else {
        return marketRef
            .where("intPrice", isLessThanOrEqualTo: priceSelection)
            .snapshots();
      }
    } else {
      return marketRef.snapshots();
    }
  }

  //delete item in the general market
  Future<void> deleteDoc(String docId, String collectionName) async {
    await marketRef.doc(docId).delete();
  }

  //Delete saved doc
  Future<void> deleteSavedDoc(String docId, String buyerID) async {
    await FirebaseFirestore.instance
        .collection("savedAd")
        .doc(buyerID)
        .collection("individualSaved")
        .doc(docId)
        .delete();
  }

  //Delete saved Documents for all users that saved
  Future<void> deleteAllSavedAds(String actualDocID) async {
    print("this block has started");

    final firestore = FirebaseFirestore.instance.collection("savedAd");
    final outerDocs = await firestore.get();

    print("OuterDocs length: ${outerDocs.docs.length}");
    print("this second block has started");

    for (final x in outerDocs.docs) {
      final outerDocId = x.id;
      print(" outer doc : $outerDocId");

      try {
        final subDocs = await firestore
            .doc(outerDocId)
            .collection("individualSaved")
            .where("docId", isEqualTo: actualDocID)
            .get();

        print("Found ${subDocs.docs.length} matches in $outerDocId");

        for (final y in subDocs.docs) {
          print("Inner doc: ${y.id}");
          await y.reference.delete();
        }
      } catch (e) {
        print("Error in $outerDocId: $e");
      }
    }
  }

  //Get savedAd from Database
  Stream<QuerySnapshot> getIndividualSaved(String userID) {
    return FirebaseFirestore.instance
        .collection("savedAd")
        .doc(userID)
        .collection("individualSaved")
        .snapshots();
  }

  //check if documents exists
  Future<bool> checkAd(String userId, String docId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection("savedAd")
        .doc(userId)
        .collection("individualSaved")
        .where("docId", isEqualTo: docId)
        .limit(1)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  //write into the saved Database
  Future<void> saveAdIntoDatabase(
    String buyerId,
    String docId,
    String description,
    String price,
    String brand,
    String model,
    String ram,
    String rom,
    String condition,
    String location,
    String imageUrl,

    String swappable,
    String email,
    String username,
    String whatsappNumber,
    String vendorId,
  ) async {
    //set the document first
    await FirebaseFirestore.instance.collection("savedAd").doc(buyerId).set({});
    //add for each individual user
    final docRef = await FirebaseFirestore.instance
        .collection("savedAd")
        .doc(buyerId)
        .collection("individualSaved")
        .doc(docId)
        .set({
          "description": description,
          "price": price,
          "brand": brand,
          "model": model,
          "ram": ram,
          "rom": rom,
          "condition": condition,
          "location": location,
          "imageUrl": imageUrl,

          "swappable": swappable,
          "docId": docId,
          "email": email,
          "username": username,
          "whatsappNumber": whatsappNumber,
          "userId": vendorId,
        });
  }
}

final buyersDatabaseProvider = Provider((ref){
  return BuyersDatabase();
});
