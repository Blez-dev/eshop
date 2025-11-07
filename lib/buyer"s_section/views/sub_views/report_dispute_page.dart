import 'package:eshop/buyer%22s_section/services/profile_repository.dart';
import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/vendor_directory/widgets/custom_textfield_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes_file/route_paths.dart';
import '../../../vendor_directory/widgets/custom_textfield_3.dart';

class ReportDisputePage extends ConsumerWidget {
  ReportDisputePage({super.key});

  final _usernameController = TextEditingController();
  final _disputeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAction = ref.read(profileStateProvider.notifier);
    final reportState = ref.watch(profileStateProvider);
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
                    "Report Dispute",
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
            Image.asset("assets/images/report.png", height: 120.h, width: 120.w),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField(
                hintText: "Enter Vendor's username",
                controller: _usernameController,
                obscureText: false,
              ),
            ),
             SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField3(
                hintText: "Report Dispute in summary",
                controller: _disputeController,
                keyboardType: TextInputType.multiline,
                obscureText: false,
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomButton(
                width: double.infinity,
                text: "Report",
                isLoading: reportState.isDisputeReportSending,
                onTap: () async {
                  await reportAction.reportDispute(
                    _disputeController.text.trim(),
                    _usernameController.text.trim(),
                  );
                  _disputeController.text = "";
                  _usernameController.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
