import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/buyer%22s_section/widgets/info_details_page.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsPage extends ConsumerWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileProviderState = ref.watch(profileStateProvider);
    return Scaffold(
      backgroundColor: Color(0xfff7f8f9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                  Text("Account Info",  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24.sp,
                  ),),
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Color(0xffFFA6A6),
                  border: BoxBorder.all(color: Colors.white, width: 8.w),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(child: Image.asset("assets/images/avatar.png")),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username", style: TextStyle(color: Color(0xff222222))),
                  SizedBox(height: 10.h),
                  InfoDetailsPage(
                    childWidget: Row(
                      children: [
                        Icon(Icons.person,color: Color(0xFFDB3022),),
                        SizedBox(width: 10.w),
                        Text(
                          profileProviderState.username.isEmpty
                              ? ""
                              : profileProviderState.username,
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(color: Color(0xff222222))),
                  SizedBox(height: 10.h),
                  InfoDetailsPage(
                    childWidget: Row(
                      children: [
                        Icon(Icons.email_outlined, size: 20.sp,color: Color(0xFFDB3022),),
                        SizedBox(width: 10.w),
                        Text(
                          profileProviderState.email.isEmpty
                              ? ""
                              : profileProviderState.email,
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(color: Color(0xff222222)),
                  ),
                  SizedBox(height: 10.h),
                  InfoDetailsPage(
                    childWidget: Row(
                      children: [
                        Icon(Icons.phone,color: Color(0xFFDB3022),),
                        SizedBox(width: 10.w),
                        Text(
                          profileProviderState.whatsappNumber.isEmpty
                              ? ""
                              : "+234${profileProviderState.whatsappNumber}",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
