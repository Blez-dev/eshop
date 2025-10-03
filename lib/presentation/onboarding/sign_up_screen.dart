import 'package:eshop/data/services/sign_up_state_controller.dart';
import 'package:eshop/presentation/components/back_button.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/social_tile.dart';
import 'package:eshop/presentation/components/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/services/firebase_auth_state_notifier.dart';
import '../../routes_file/route_paths.dart';

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

  // function to sign in
  void signUp(
    AuthNotifier obj,
    String email,
    String password,
    String username,
    String confirmPassword,
    BuildContext context,
    bool isVendor,
    bool isBuyer,
  ) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        username.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        (isVendor || isBuyer)) {
      if (confirmPassword == password) {
        final result = await obj.signup(email, password, context);
        if (!context.mounted) return;
        if (result != null && isVendor) {
          context.push(RoutePaths.signIn);
          ToastHelper.success(context, "Signup Successful");
        } else if (result != null && isBuyer) {
          context.push(RoutePaths.navigator);
          ToastHelper.success(context, "Signup Successful");
        }
      } else {
        ToastHelper.error(context, "confirm password and password must match");
      }
    } else {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          confirmPassword.isNotEmpty) {
        ToastHelper.error(
          context,
          "Kindly pick your role \"Vendor\" or \"Buyer\"",
        );
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomBackButton(
                        onTap: () {
                          context.pop();
                        },
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Hello! Register to get \nstarted",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        hintText: "Username",
                        controller: usernameController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        hintText: "Email",
                        controller: emailController,
                        obscureText: false,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        hintText: "Password",
                        obscureText: isEye,
                        controller: passwordController,
                        icon: IconButton(
                          onPressed: () {
                            ref.read(signUpEyeState.notifier).eyeToggle();
                          },
                          icon: !isEye
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        hintText: "Confirm password",
                        obscureText: isEye2,
                        controller: confirmPasswordController,
                        icon: IconButton(
                          onPressed: () {
                            ref.read(signUpEyeState2.notifier).eyeToggle();
                          },
                          icon: !isEye2
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
                                    ref.read(signUpCheckBox.notifier).toggele();
                                    ref
                                        .read(signUpCheckBox2.notifier)
                                        .defaultval();
                                  },
                                  icon: Icon(
                                    isCheckedVendor
                                        ? Icons.check_box
                                        : Icons
                                              .check_box_outline_blank_outlined,
                                    color: Color.fromRGBO(219, 48, 34, 1),
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
                                    ref.read(signUpCheckBox2.notifier).toggle();
                                    ref
                                        .read(signUpCheckBox.notifier)
                                        .defaultval();
                                  },
                                  icon: Icon(
                                    isCheckedBuyer
                                        ? Icons.check_box
                                        : Icons
                                              .check_box_outline_blank_outlined,
                                    color: Color.fromRGBO(219, 48, 34, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: const Color(0xff6A707C)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                              "Or Register With",
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

            // Fixed bottom text
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 10),
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
