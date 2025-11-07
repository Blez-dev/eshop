import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDeleteAccount extends ConsumerStatefulWidget {
  const ConfirmDeleteAccount({super.key});

  @override
  ConsumerState<ConfirmDeleteAccount> createState() =>
      _ConfirmDeleteAccountState();
}

class _ConfirmDeleteAccountState extends ConsumerState<ConfirmDeleteAccount> {
  final _enterPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final deleteAction = ref.read(profileStateProvider.notifier);
    final deleteState = ref.watch(profileStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // context.go(RoutePaths.profilePage);
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                  Text(
                    "Confirm Account Deletion",
                    style: TextStyle(color: Colors.black),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back_ios_new, size: 15.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                "Enter Password",
                style: TextStyle(
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField(
                hintText: "Enter Password",
                controller: _enterPasswordController,
                obscureText: !isPasswordVisible,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: !isPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                "Confirm Password",
                style: TextStyle(
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField(
                hintText: "Confirm Password",
                controller: _confirmPasswordController,
                obscureText: !isConfirmPasswordVisible,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  icon: !isConfirmPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 50.w),
              child: CustomButton(
                isLoading: deleteState.isAccountDeleting,
                width: double.infinity,
                text: "Delete Account",
                onTap: () async{
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return PopScope(
                            canPop: false,
                            child: SpinKitFadingCircle(
                                color: Colors.black, size: 40.sp));
                      });
                 await deleteAction.deleteUser(
                    _enterPasswordController.text.trim(),
                    _confirmPasswordController.text.trim(),
                  );


                 if(!context.mounted) return;
                 if(FirebaseAuth.instance.currentUser==null){
                   context.go(RoutePaths.navigator);
                   SecondToastHelper.success("Account deleted successfully");
                 }else{
context.pop();
                 }


                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
