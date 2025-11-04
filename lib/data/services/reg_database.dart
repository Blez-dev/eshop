import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(String email,String username,String whatsappNumber) async{
    //collect user Uid
    String uid = FirebaseAuth.instance.currentUser!.uid;
     await firestore.collection("usersInfo").doc(uid).set(
        {
          "email": email,
          "username" :username,
          "whatsappNumber": whatsappNumber,
        });
  }

  //fetch users info
Future<DocumentSnapshot> getUserInfo () async {
  //collect user Uid
  String uid = FirebaseAuth.instance.currentUser!.uid;

  DocumentSnapshot info = await firestore.collection("usersInfo").doc(uid).get();

  return info;
}

}