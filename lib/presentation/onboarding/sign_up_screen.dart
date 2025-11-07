import 'package:eshop/data/services/sign_up_state_controller.dart';
import 'package:eshop/presentation/components/back_button.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/number_container.dart';
import 'package:eshop/presentation/components/phone_number_text_field.dart';
import 'package:eshop/presentation/components/social_tile.dart';
import 'package:eshop/presentation/components/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/services/firebase_auth_state_notifier.dart';
import '../../routes_file/route_paths.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController numberController =
  TextEditingController();

  // function to sign in
  void signUp(
    AuthNotifier obj,
    String email,
    String password,
    String username,
    String confirmPassword,
    BuildContext context,

      String whatsappNumber
  ) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        username.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        whatsappNumber.isNotEmpty&&
        whatsappNumber.length==10
        ) {
      if (confirmPassword == password) {
        final result = await obj.signup(email, password, context,username,whatsappNumber);
        if (!context.mounted) return;
        if (result != null) {
          ToastHelper.success(context, "Signup Successful");
          await Future.delayed(Duration(milliseconds: 1000));
          if (!context.mounted) return;
          context.push(RoutePaths.signIn);
        } else if (result != null ) {
          ToastHelper.success(context, "Signup Successful");
          await Future.delayed(const Duration(milliseconds: 1000));
          if (!context.mounted) return;
          context.push(RoutePaths.signIn);
        }
      } else {
        ToastHelper.error(context, "confirm password and password must match");
      }
    } else {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          whatsappNumber.isNotEmpty&&
          confirmPassword.isNotEmpty) {
       if(whatsappNumber.length!=10){
         ToastHelper.error(
           context,
           "Number must be of 10 characters",
         );
       }
      } else {
        ToastHelper.error(context, "Kindly fill in all fields");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCheckedVendor = ref.watch(signUpCheckBox);
    final isCheckedBuyer = ref.watch(signUpCheckBox2);
    final isEye = ref.watch(signUpEyeState);
    final isEye2 = ref.watch(signUpEyeState2);
    final authStateWatch = ref.watch(authProvider);
    final authStateRead = ref.read(authProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top content is scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 35.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: CustomBackButton(),
                      ),
                       SizedBox(height: 25.h),
                      Text(
                        "Hello! Register to get \nstarted",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                       SizedBox(height: 25.h),
                      Row(

                        children: [
                          NumberContainer(
                            text: Text("+234"),
                            imagePath: "assets/images/nigerian_flag.png",
                          ),
                          SizedBox(width: 10.w,),
                          PhoneNumberTextField(
                            hintText: "Enter Whatsapp Number Here",
                            controller: numberController,
                            obscureText: false,
                          ),
                        ],
                      ),

                       SizedBox(height: 15.h),
                      CustomTextField(
                        inputLength: 20,
                        hintText: "Username",
                        controller: usernameController,
                        obscureText: false,
                      ),
                       SizedBox(height: 15.h),
                      CustomTextField(
                        hintText: "Email",
                        controller: emailController,
                        obscureText: false,
                      ),
                       SizedBox(height: 15.h),
                      CustomTextField(
                        hintText: "Password",
                        obscureText: !isEye,
                        controller: passwordController,
                        icon: IconButton(
                          onPressed: () {
                            ref.read(signUpEyeState.notifier).eyeToggle();
                          },
                          icon: isEye
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                       SizedBox(height: 15.h),
                      CustomTextField(
                        hintText: "Confirm password",
                        obscureText: !isEye2,
                        controller: confirmPasswordController,
                        icon: IconButton(
                          onPressed: () {
                            ref.read(signUpEyeState2.notifier).eyeToggle();
                          },
                          icon: isEye2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                       SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          InkWell(
                            onTap: () {
                              context.push(RoutePaths.forgotPassword);
                            },
                            child: Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: const Color(0xff6A707C)),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 30.h),
                      CustomButton(
                        isLoading: authStateWatch.isLoading,
                        width: double.infinity,
                        text: "Register",
                        onTap: () {

                          signUp(
                            authStateRead,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            usernameController.text.trim(),
                            confirmPasswordController.text.trim(),
                            context,

                            numberController.text.trim(),
                          );
                        },
                      ),
                       SizedBox(height: 30.h),


                    ],
                  ),
                ),
              ),
            ),

            // Fixed bottom text
            SizedBox(
              height: 50.h,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                     SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        context.push(RoutePaths.signIn);
                      },
                      child: Text(
                        "Login Now",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xffDB3022),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
