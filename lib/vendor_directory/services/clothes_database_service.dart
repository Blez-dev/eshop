import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhonesDatabaseService {
  final firestoreInstance = FirebaseFirestore.instance;

  final CollectionReference database = FirebaseFirestore.instance.collection(
    "users",
  );

  final userId = FirebaseAuth.instance.currentUser!.uid;

  //get documents in streams for clothes
  Stream<QuerySnapshot> getDocs(String collectionName) {
    final documentStream = database
        .doc(userId)
        .collection(collectionName)
        .orderBy('docId', descending: true)
        .snapshots();
    return documentStream;
  }
  //method to delete a document
  Future<void> deleteDoc(String docId,String collectionName) async {
    await database.doc(userId).collection(collectionName).doc(docId).delete();
  }

}

final clothesProvider = Provider((ref) {
  return PhonesDatabaseService();
});
