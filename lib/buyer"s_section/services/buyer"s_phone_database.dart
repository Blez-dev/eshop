import 'package:cloud_firestore/cloud_firestore.dart';

class BuyersDatabase {
  final CollectionReference marketRef = FirebaseFirestore.instance.collection(
    "market",
  );

  //get phone items

  Stream<QuerySnapshot> getPhoneItems() {
    return marketRef.snapshots();
  }

  //get items dynamically
  Stream<QuerySnapshot> getPhoneItemsByBrandAndPrice(int priceSelection,
      String brandSelection,) {
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

  //delete item
  Future<void> deleteDoc(String docId, String collectionName) async {
    await marketRef.doc(docId).delete();
  }

}