import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/data/services/reg_database.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchWhatsapp {
  final RegDatabase userInfoObj = RegDatabase();
  String? userName;

  Future<void> launchWhatsapp(
    String whatsappNumber,
    String vendorName,
    String model,
  ) async {
    try {
      DocumentSnapshot userInfo = await userInfoObj.getUserInfo();
      final userData = userInfo.data() as Map<String, dynamic>?;
      userName = userData?["username"] ?? "user";

      if (vendorName == userName) {
        SecondToastHelper.error("You can't message yourself");
        return;
      }

      final fullNumber = "234$whatsappNumber";

      final encodedMsg = Uri.encodeComponent(
        "Good day $vendorName, my name is $userName and I'm texting from eShop App. "
        "I'm interested in the $model ad you posted.",
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
        SecondToastHelper.error("Whatsapp successfully launched");
      } else if (!launched) {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      } else {
        SecondToastHelper.error(
          "Unable to open WhatsApp. Please check your installation.",
        );
      }
    } catch (e) {
      SecondToastHelper.error("An error occurred: $e");
    }
  }

  Future<void> launchCall(String phoneNumber) async {
    final number = "0$phoneNumber";
    final Uri callUri = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch phone call to $number';
    }
  }
}
