import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../routes_file/route_paths.dart';
import '../../widgets/icon_tile.dart';

class ContactUsOptionsPage extends ConsumerWidget {
  const ContactUsOptionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsAction = ref.read(profileStateProvider.notifier);
    final contactUsState = ref.watch(profileStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon:  Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                   Text(
                    "Contact Us Via",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.sp,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                ],
              ),
            ),

             SizedBox(height: 30.h),

            // First contact option
            GestureDetector(
              onTap: ()async{

                await contactUsAction.contactAdmin(
                  contactUsState.username.isEmpty
                      ? "User"
                      : contactUsState.username,
                );

              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 32.w),
                child: Container(
                  height: 65.h,
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children:  [
                      IconTile(iconTileWidget: Icon(FontAwesomeIcons.whatsapp)),
                      SizedBox(width: 15.w),
                      Text(
                        "Contact Via Whatsapp",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 15.sp),
                    ],
                  ),
                ),
              ),
            ),

            // Second contact option
            GestureDetector(
              onTap: () {
                context.push(RoutePaths.composeMessagePage);
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 32.w),
                child: Container(
                  height: 65.h,
                  width: double.infinity,
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius:  BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children:  [
                      IconTile(
                        iconTileWidget: Icon(
                          FontAwesomeIcons.comment,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "Compose a Message",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 15.sp),
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
