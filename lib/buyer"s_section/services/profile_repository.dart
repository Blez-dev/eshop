import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../presentation/components/flutter_toast.dart';
import '../../presentation/onboarding/controller/auth_controller_state.dart';

class ProfileRepository {

  //fetch user info
  Future<DocumentSnapshot> fetchUserInfo() async {
    //
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    //Get User UID
    final _userUid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userInfo = await firestore
        .collection("usersInfo")
        .doc(_userUid)
        .get();

    return userInfo;
  }

  //userToAdminMessage
  Future<void> userToAdminMessage(String message) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    //set in the document
    await FirebaseFirestore.instance.collection("userMessage").add({
      "message": message,
      "user": userId,
    });
  }

  //Report dispute
  Future<void> reportDispute(String dispute, String vendorUsername) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    //ad in the document
    await FirebaseFirestore.instance.collection("disputeReport").add({
      "vendorsName": vendorUsername,
      "reporterId": userId,
      "dispute": dispute,
    });
  }

  //launch whatsapp
  Future<void> launchWhatsappToAdmin(String username) async {
    try {
      final fullNumber = "2348168463261";
      final encodedMsg = Uri.encodeComponent(
        "Good day @admin eShop, my name is $username and I'm texting from eShop App. ",
      );
      final Uri directUrl = Uri.parse(
        "whatsapp://send?phone=$fullNumber&text=$encodedMsg",
      );
      final Uri webUrl = Uri.parse(
        "https://wa.me/$fullNumber?text=$encodedMsg",
      );
      final bool launched = await launchUrl(
        webUrl,
        mode: LaunchMode.externalApplication,
      );
      if (launched) {
        SecondToastHelper.error("Opening Whatsapp...");
      } else if (!launched) {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
        SecondToastHelper.error("Opening the Web...");
      } else {
        SecondToastHelper.error(
          "Unable to open WhatsApp. Please check your installation.",
        );
      }
    } catch (e) {
      SecondToastHelper.error("An error occurred: $e");
    }
  }

  //Report Ad
  Future<void> reportAd(String adNumber) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    //ad in the document
    await FirebaseFirestore.instance.collection("adReport").add({
      "reporterId": userId,
      "adNumber": adNumber,
    });
  }

  //Log user out
  Future<void> logoutUser() async {
    final firebase = FirebaseAuth.instance;
    try {
      await firebase.signOut();
      AuthController.setVendorRole("isVendor", false);
      AuthController.setBuyerRole("isBuyer", false);
      AuthController.setLoginState("isLoggedIn", false);
    } catch (e) {}
  }

  //Delete user
  Future<void> deleteUser(String password, String confirmPassword) async {
    if (password.isEmpty || confirmPassword.isEmpty) {

      throw Exception("The Two fields must be filled");

    } else if (password != confirmPassword) {

      throw Exception("Password must match");
    } else {
      try {
        final user = FirebaseAuth.instance.currentUser!;
        final userId = FirebaseAuth.instance.currentUser!.uid;

        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );

        await user.reauthenticateWithCredential(credential);

        //delete all vendor"s ad

        //delete from vendors page
        final querySnapshot1 = await FirebaseFirestore.instance
            .collection("users")
            .doc(userId)
            .collection("phones")
            .where("userId", isEqualTo: userId)
            .get();
        for (var x in querySnapshot1.docs) {
          x.reference.delete();
        }

        //delete from market
        final querySnapshot2 = await FirebaseFirestore.instance
            .collection("market")
            .where("userId", isEqualTo: userId)
            .get();
        for (var y in querySnapshot2.docs) {
          y.reference.delete();
        }

        //delete from saved
        final outerDocs = await FirebaseFirestore.instance
            .collection("savedAd")
            .get();

        for (var z in outerDocs.docs) {
          //get docId
          var docId = z.id;

          //access the inner documents
          final innerDocs = await FirebaseFirestore.instance
              .collection("savedAd")
              .doc(docId)
              .collection("individualSaved")
              .where("userId", isEqualTo: userId)
              .get();

          for (var a in innerDocs.docs) {
            a.reference.delete();
          }
        }

        //delete userInfo
        await FirebaseFirestore.instance
            .collection("usersInfo")
            .doc(userId)
            .delete();

        //delete userAccount
        await FirebaseAuth.instance.currentUser!.delete();

        AuthController.setVendorRole("isVendor", false);
        AuthController.setBuyerRole("isBuyer", false);
        AuthController.setLoginState("isLoggedIn", false);


      } on FirebaseAuthException catch (e) {
        throw Exception(e.code);
      }
    }
  }
}

final profileRepositoryProvider = Provider((ref) {
  return ProfileRepository();
});
