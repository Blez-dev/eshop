import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/buyer%22s_section/widgets/profile_cards.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/components/button.dart';
import '../../presentation/components/custom_outlined_button.dart';
import '../../presentation/onboarding/controller/auth_controller_state.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    final profileProviderAction = ref.read(profileStateProvider.notifier);
    final profileProviderState = ref.watch(profileStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffFFA6A6)),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Text("Profile", style: TextStyle(fontSize: 24.sp)),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 8.w,
                            ),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileProviderState.username.isEmpty
                                  ? ""
                                  : profileProviderState.username,
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              profileProviderState.email.isEmpty
                                  ? ""
                                  : profileProviderState.email,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: profileProviderState.isLoggingOutUser?
              Center(child:  SpinKitFadingCircle(
                color: Colors.black,
                size: 25.sp,
              )):

              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
                child: Container(
                  padding: EdgeInsets.all(40.r),
                  height: MediaQuery.of(context).size.height * 0.6.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xfff7f8f9)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.push(RoutePaths.accountDetailsPage);
                        },
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.account_circle,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Account",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey, width: 0.5.w),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AuthController.setVendorRole("isVendor", true);
                          AuthController.setBuyerRole("isBuyer", false);
                          context.go(RoutePaths.vendorItemsPage);
                        },
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.swap_horiz_outlined,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Switch to vendor's section",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey, width: 0.5.w),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.push(RoutePaths.contactUsOptionPage);
                        },
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.phone,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Contact us",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey, width: 0.5.w),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.push(RoutePaths.reportOptionsPage);
                        },
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.flag,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Report a Vendor/Ad",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey, width: 0.5.w),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          context.push(RoutePaths.confirmDeleteAccount);
                          // showDialog(
                          //   context: context,
                          //   builder: (builder) {
                          //     return AlertDialog(
                          //       backgroundColor: Colors.white,
                          //       title: Text(
                          //         "Delete Account",
                          //         style: TextStyle(fontWeight: FontWeight.w700),
                          //       ),
                          //       content: Text(
                          //         "All associated data  & account will be deleted ",
                          //         style: TextStyle(color: Colors.grey),
                          //       ),
                          //       actions: [
                          //         CustomButton(
                          //           width: double.infinity,
                          //           text: "Delete Account",
                          //           onTap: () async {
                          //             await profileProviderAction.deleteUser();
                          //             if(!context.mounted) return;
                          //             context.pop();
                          //           },
                          //         ),
                          //         SizedBox(height: 10),
                          //         CustomOutlinedButton(
                          //           width: double.infinity,
                          //           text: "Cancel",
                          //           onTap: () {
                          //             context.pop();
                          //           },
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        },
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.delete_outline,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Delete Account",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.grey, width: 0.5.w),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text(
                                  "Logout",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                content: Text(
                                  "Are you sure you wanna log out?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                actions: [
                                  CustomButton(
                                    width: double.infinity,
                                    text: "Logout",
                                    onTap: () async {
                                      await profileProviderAction.logUserOut();
                                      final  user= FirebaseAuth.instance.currentUser;
                                      if(user==null){
                                        if (!context.mounted) return;
                                        context.go(RoutePaths.navigator);
                                      }
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
                        child: CustomProfileChip(
                          iconTileWidget: Icon(
                            Icons.logout,
                            color: Color(0xFFDB3022),
                          ),
                          text: "Logout",
                        ),
                      ),
                    ],
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
