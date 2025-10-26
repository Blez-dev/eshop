import 'package:cloud_firestore/cloud_firestore.dart';

class BuyersDatabase{


  final CollectionReference marketRef= FirebaseFirestore.instance.collection("market");


  //get phone items

Stream<QuerySnapshot> getPhoneItems (){
  return marketRef.snapshots();
}


//delete item
  Future<void> deleteDoc(String docId,String collectionName) async {
    await marketRef.doc(docId).delete();
  }
}