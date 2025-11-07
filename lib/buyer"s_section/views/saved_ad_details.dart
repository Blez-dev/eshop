import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/buyer%22s_section/models/savedAdClass.dart';
import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/buyer%22s_section/services/launch_whatsapp.dart';
import 'package:eshop/buyer%22s_section/services/save_ad_repository.dart';
import 'package:eshop/buyer%22s_section/state_manager/savedAdNotifer.dart';
import 'package:eshop/buyer%22s_section/widgets/custom_button_2.dart';
import 'package:eshop/buyer%22s_section/widgets/custom_outlined_button_2.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SavedAdDetails extends ConsumerStatefulWidget {
  final SavedAd adData;


  final LaunchWhatsapp whatsappLauncher = LaunchWhatsapp();
  final SaveAdRepo saveAdRepo = SaveAdRepo();
  final BuyersDatabase buyersDatabase = BuyersDatabase();

  final myId = FirebaseAuth.instance.currentUser!.uid;

  SavedAdDetails({
    super.key,
    required this.adData,

  });

  @override
  ConsumerState<SavedAdDetails> createState() => _PhoneDetailsPageState();
}

class _PhoneDetailsPageState extends ConsumerState<SavedAdDetails> {
  late bool adIsSaved;



  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.adData.imageUrl ?? "";
    final phonePrice = widget.adData.price;
    final savedAdAction = ref.read(savedAdNotifierProvider.notifier);
    final savedAdState = ref.watch(savedAdNotifierProvider);

    return Scaffold(
      backgroundColor: Color(0xffE8ECF4),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            height: 36.h,
                            width: 36.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            child: Center(
                              child:  Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    const Spacer(),
                     SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55.h,
                  color: Color(0xffE8ECF4),
                  padding:  EdgeInsets.all(20.r),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: BoxBorder.all(
                              width: 1.w,
                              color: Colors.white,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    widget.adData.location,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.adData.model,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    widget.adData.price,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  CustomOutlinedButton2(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.35.w,
                                    text: "Whatsapp",
                                    onTap: () async {
                                      await widget.whatsappLauncher
                                          .launchWhatsapp(
                                        widget.adData.whatsappNumber!,
                                        widget.adData.username!,
                                        widget.adData.model,
                                      );
                                    },
                                  ),
                                  Spacer(),
                                  CustomButton3(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.35.w,
                                    text: "Call",
                                    onTap: () async {

                                        await widget.whatsappLauncher.launchCall(
                                          widget.adData.whatsappNumber,
                                        );

                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: BoxBorder.all(
                              width: 1.w,
                              color: Colors.white,
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Brand",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.adData.brand,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Condition",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.adData.condition,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),

                                  Text(
                                    "Swappable?",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.adData.swappable,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Ad ID",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.adData.docId,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Vendor",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.adData.username ?? "Null",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Ram",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.adData.ram,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "Rom",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.adData.rom,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    "",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(20.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: BoxBorder.all(
                              width: 1.w,
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            widget.adData.description,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
