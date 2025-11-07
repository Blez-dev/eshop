import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/vendor_directory/widgets/custom_textfield_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes_file/route_paths.dart';

class ReportAdPage extends ConsumerWidget {
  ReportAdPage({super.key});

  final _adNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAdAction = ref.read(profileStateProvider.notifier);
    final reportAdState = ref.watch(profileStateProvider);
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
                    "Report Ad",
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
            SizedBox(height: 100.h),
            Image.asset(
              "assets/images/reportIcon.png",
              height: 120.h,
              width: 120.w,
            ),
             SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: _adNumberController,
                decoration: InputDecoration(
                  hintText: "Enter Ad order Number",
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xff8391A1),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF7F8F9),
                  // background color
                  contentPadding:  EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 20.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:  BorderSide(
                      color: Colors.grey, // border color
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:  BorderSide(color: Colors.grey, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:  BorderSide(
                      color: Colors.red, // border color when focused
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomButton(
                width: double.infinity,
                isLoading: reportAdState.isAdReporting,
                text: "Report Ad",
                onTap: () async {
                  await reportAdAction.reportAd(
                    _adNumberController.text.trim(),
                  );
                  _adNumberController.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
