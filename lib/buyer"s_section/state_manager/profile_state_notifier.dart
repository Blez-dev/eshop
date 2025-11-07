import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/buyer%22s_section/models/profile_class.dart';
import 'package:eshop/buyer%22s_section/services/profile_repository.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProfileStateNotifier extends StateNotifier<ProfileClass> {
  final ProfileRepository profileRepository;

  ProfileStateNotifier(this.profileRepository)
      : super(ProfileClass(email: "", username: "", whatsappNumber: ""));

  //Fetch User Details
  Future<void> fetchUserInfo() async {
    state=state.copyWith(infoLoading: true);
    final DocumentSnapshot userInfo = await profileRepository.fetchUserInfo();

    if (userInfo.exists) {
      final userData = userInfo.data() as Map<String, dynamic>;
      final convertedData = ProfileClass.fromJson(userData);
      state = state.copyWith(email: convertedData.email,
          username: convertedData.username,
          whatsappNumber: convertedData.whatsappNumber);
      state=state.copyWith(infoLoading: false);
    }
  }

  //contact admin
  Future<void> contactAdmin(String username)async{
    await profileRepository.launchWhatsappToAdmin(username);
    }

    //message to admin
Future<void> userToAdminMessage(String message)async{
    state=state.copyWith(isMessageSending: true);
    await profileRepository.userToAdminMessage(message);
    state=state.copyWith(isMessageSending: false);
    SecondToastHelper.success("Message Sent Successfully");
}


//report dispute
  Future<void> reportDispute(String dispute,String vendorUsername)async{
state= state.copyWith(isDisputeReportSending: true);
    await profileRepository.reportDispute(dispute, vendorUsername);
state= state.copyWith(isDisputeReportSending: false);
SecondToastHelper.success("Report  Sent Successfully");
    }


  //report ad
  Future<void> reportAd(String adNumber)async{
    state= state.copyWith(isAdReporting: true);
    await profileRepository.reportAd(adNumber);
    state= state.copyWith(isAdReporting: false);
    SecondToastHelper.success("Ad Reported Successfully");
  }

  //logout user
  Future<void> logUserOut()async{
    state=state.copyWith(isLoggingOutUser: true);
    await profileRepository.logoutUser();
    state=state.copyWith(isLoggingOutUser: false);
  }


  //delete user data
Future<void> deleteUser(String password, String confirmPassword)async{
    state=state.copyWith(isAccountDeleting: true);
    try{
      await profileRepository.deleteUser(password,confirmPassword);
      state=state.copyWith(isAccountDeleting: false);
    }catch (e){
      String message= e.toString();
      if(message.startsWith("Exception: ")){
        message = message.replaceFirst("Exception: ", "");
        state=state.copyWith(isAccountDeleting: false);
        SecondToastHelper.error(message);
      }else{
        state=state.copyWith(isAccountDeleting: false);
        SecondToastHelper.error(e.toString());
      }

    }
}
}






final profileStateProvider = StateNotifierProvider((ref){
  final prov= ref.read(profileRepositoryProvider);
  return ProfileStateNotifier(prov);
});
