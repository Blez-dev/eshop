import 'package:eshop/buyer%22s_section/state_manager/profile_state_notifier.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../routes_file/route_paths.dart';
import '../../../vendor_directory/widgets/custom_textfield_3.dart';

class ComposeMessageScreen extends ConsumerStatefulWidget {
  const ComposeMessageScreen({super.key});

  @override
  ConsumerState<ComposeMessageScreen> createState() => _ComposeMessageScreenState();
}

class _ComposeMessageScreenState extends ConsumerState<ComposeMessageScreen> {
  final composedMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sendMessageAction = ref.read(profileStateProvider.notifier);
    final sendMessageState = ref.watch(profileStateProvider);
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
                    "Send a message",
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
            Image.asset("assets/images/message.png", height: 120.h, width: 120.w),
            SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomTextField3(
                hintText: "Enter Your Message",
                controller: composedMessageController,
                keyboardType: TextInputType.multiline,
                obscureText: false,
              ),
            ),
             SizedBox(height: 30.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomButton(
                width: double.infinity,
              isLoading: sendMessageState.isMessageSending,
                text: "Send Message",
                onTap: () async{
                 await sendMessageAction.userToAdminMessage(
                    composedMessageController.text,
                  );
                 composedMessageController.text="";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
