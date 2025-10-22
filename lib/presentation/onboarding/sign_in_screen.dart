import 'package:eshop/data/models/auth_state.dart';
import 'package:eshop/data/services/firebase_auth_state_notifier.dart';

import 'package:eshop/data/services/sign_in_state_Controller.dart';
import 'package:eshop/presentation/components/back_button.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/social_tile.dart';
import 'package:eshop/presentation/components/toast_helper.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/routes_file/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SigninScreen extends ConsumerStatefulWidget {
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();



  // function to sign in
  void signIn(
    AuthNotifier obj,
    String email,
    String password,
    BuildContext context,
    bool isVendor,
    bool isBuyer,
  ) async {
    if (email.isNotEmpty && password.isNotEmpty) {

      if (!context.mounted) return;
      if ( isVendor) {
        final result = await obj.signin(email, password, context);
        if(result!=null){
          AuthController.setVendorRole("isVendor", true);
          AuthController.setBuyerRole("isBuyer", false);
          ToastHelper.success(context, "Login Successful");
          await Future.delayed(const Duration(milliseconds: 1000));
          if (!context.mounted) return;
          context.push(RoutePaths.vendorItemsPage);
        }
      } else if ( isBuyer) {
        final result = await obj.signin(email, password, context);
        if(result!=null){
          AuthController.setVendorRole("isVendor", false);
          AuthController.setBuyerRole("isBuyer", true);
          ToastHelper.success(context, "Login Successful");
          await Future.delayed(const Duration(milliseconds: 1000));
          if (!context.mounted) return;
          context.push(RoutePaths.navigator);
        }

      } else if ( (isBuyer && isVendor) == false) {
        ToastHelper.error(
          context,
          "Kindly pick your role \"Vendor\" or \"Buyer\"",
        );
      }
    } else {
      ToastHelper.error(context, "All fields are required");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isCheckedVendor = ref.watch(checkBox);
    final isCheckedBuyer = ref.watch(checkBox2);
    final isEye = ref.watch(eyeState);
    final authStateWatch = ref.watch(authProvider);
    final authStateRead = ref.read(authProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomBackButton(onTap: () => context.pop()),
                      const SizedBox(height: 25),
                      Text(
                        "Welcome back!, Glad \n to see you, Again!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        hintText: "Enter your email",
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        hintText: "Enter your password",
                        obscureText: isEye,
                        controller: passwordController,
                        icon: IconButton(
                          onPressed: () =>
                              ref.read(eyeState.notifier).eyeToggle(),
                          icon: !isEye
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Vendor",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: const Color(0xff1E232C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref.read(checkBox.notifier).toggele();
                                    ref.read(checkBox2.notifier).defaultval();
                                  },
                                  icon: Icon(
                                    isCheckedVendor
                                        ? Icons.check_box
                                        : Icons
                                              .check_box_outline_blank_outlined,
                                    color: const Color(0xFFDB3022),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Buyer",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: const Color(0xff1E232C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref.read(checkBox2.notifier).toggle();
                                    ref.read(checkBox.notifier).defaultval();
                                  },
                                  icon: Icon(
                                    isCheckedBuyer
                                        ? Icons.check_box
                                        : Icons
                                              .check_box_outline_blank_outlined,
                                    color: const Color(0xFFDB3022),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                      const SizedBox(height: 30),
                      CustomButton(
                        width: double.infinity,
                        isLoading: authStateWatch.isLoading,
                        text: "Login",
                        onTap: () {
                          signIn(
                            authStateRead,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            context,
                            isCheckedVendor,
                            isCheckedBuyer,
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Color(0xffE8ECF4)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Or Login With",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: const Color(0xff6A707C)),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Color(0xffE8ECF4)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: SocialTile(image: "assets/images/fb.png"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SocialTile(
                              image: "assets/images/google.png",
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SocialTile(image: "assets/images/apple.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 10),

                  InkWell(
                    onTap: () {
                      context.go(RoutePaths.signUp);
                    },
                    child: Text(
                      "Register Now",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xffDB3022),
                        fontWeight: FontWeight.bold,
                      ),
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
