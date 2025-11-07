

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/buyer%22s_section/state_manager/saved_item_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/components/button.dart';
import '../../presentation/components/custom_outlined_button.dart';
import '../../vendor_directory/services/clothes_database_service.dart';
import '../models/savedAdModel.dart';
import '../services/buyer"s_phone_database.dart';

class SavedAdPage extends ConsumerStatefulWidget {
  const SavedAdPage({super.key});

  @override
  ConsumerState<SavedAdPage> createState() => _SavedAdPageState();
}

class _SavedAdPageState extends ConsumerState<SavedAdPage> {
  final phonesDB = PhonesDatabaseService();
  final marketPhoneDb = BuyersDatabase();
  final myId=FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    final stateDeleteReader= ref.read(buyersStateProvider.notifier);
    final stateDeleteWatcher= ref.watch(buyersStateProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF9F9F9),
        title: Text("Your Saved Ads", style: TextStyle(color: Colors.red)),

      ),
      body: SafeArea(
        child: stateDeleteWatcher.isDeleting?
        Center(child: SpinKitFadingCircle(color: Colors.black, size: 25.sp),):
        StreamBuilder(
          stream: marketPhoneDb.getIndividualSaved(myId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitFadingCircle(color: Colors.black, size: 25.sp),
              );
            }
            if (snapshot.hasError) {
              //The text not showing, might be the color
              return Center(
                child: Text(
                  "An error has occurred",
                  style: TextStyle(color: Colors.black, fontSize: 20.sp),
                ),
              );
            }
            //The text not showing, might be the color

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "No Saved Ad yet",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20.sp),
                ),
              );
            }

            final savedPhonesDatas = snapshot.data!.docs;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: savedPhonesDatas.length,
                    itemBuilder: (context, index) {
                      var data =
                      savedPhonesDatas[index].data() as Map<String, dynamic>;

                      SavedAdPhones savedPhoneData = SavedAdPhones.fromJson(data);

                      String docId = savedPhonesDatas[index].id;

                      return Container(
                        margin:  EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        height: 104.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: SizedBox(
                                height: 104.h,
                                width: 104.w,
                                child: savedPhoneData.imageUrl == null
                                    ? const SizedBox()
                                    : CachedNetworkImage(
                                  placeholder: (context, url) =>
                                   SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: SpinKitFadingCircle(
                                      color: Colors.black,
                                      size: 25.sp,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                  imageUrl: savedPhoneData.imageUrl,
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  savedPhoneData.model,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  savedPhoneData.condition,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  savedPhoneData.price,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),

                                Text(
                                  "0${savedPhoneData.whatsappNumber}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),

                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Text("Delete Ad"),
                                          content: Text(
                                            "Action is irreversible",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          actions: [
                                            CustomButton(
                                              width: double.infinity,
                                              text: "Delete",
                                              onTap: () async{
                                                 stateDeleteReader.deleteFromAllUser(savedPhoneData.docId, myId);
                                                if (!context.mounted) return;
                                                context.pop();
                                              },
                                            ),
                                            SizedBox(height: 10.h),
                                            CustomOutlinedButton(
                                              width: double.infinity,
                                              text: "Cancel",
                                              onTap: () {
                                                context.pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.delete_outline),
                                  color: Color(0xFFDB3022),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}
