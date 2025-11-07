import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes_file/route_paths.dart';
import '../../widgets/icon_tile.dart';

class ReportOptionsPage extends StatelessWidget {
  const ReportOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Report Vendor/ Ad",
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
              onTap: (){
                context.push(RoutePaths.reportDisputePage);
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
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children:  [
                      IconTile(iconTileWidget: Icon(FontAwesomeIcons.whatsapp)),
                      SizedBox(width: 15.w),
                      Text(
                        "Report Dispute",
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
              onTap: (){
                context.push(RoutePaths.reportVendorAd);
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
                      IconTile(iconTileWidget: Icon(FontAwesomeIcons.comment,size: 18.sp,)),
                      SizedBox(width: 15.w),
                      Text(
                        "Report Vendor's Ad",
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
