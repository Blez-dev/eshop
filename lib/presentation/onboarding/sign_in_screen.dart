import 'package:eshop/presentation/components/back_button.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/social_tile.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isVisible = false;
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top content is scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CustomBackButton(onTap: () {}),
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
                        obscureText: isVisible,
                        controller: passwordController,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: !isVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: const Color(0xff6A707C)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        width: double.infinity,
                        text: "Login",
                        onTap: () {},
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(color: Color(0xffE8ECF4))),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Or Login With",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: const Color(0xff6A707C)),
                            ),
                          ),
                          const Expanded(
                              child: Divider(color: Color(0xffE8ECF4))),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                              child: SocialTile(image: "assets/images/fb.png")),
                          const SizedBox(width: 12),
                          Expanded(
                              child: SocialTile(
                                  image: "assets/images/google.png")),
                          const SizedBox(width: 12),
                          Expanded(
                              child: SocialTile(
                                  image: "assets/images/apple.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Fixed bottom text
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
                  Text(
                    "Register Now",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xffDB3022),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
