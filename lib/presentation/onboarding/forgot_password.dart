import 'package:eshop/data/services/firebase_auth_state_notifier.dart';

import 'package:eshop/presentation/components/back_button.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/presentation/components/toast_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final TextEditingController _forgotPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _forgotPasswordController.dispose();
    AuthNotifier.success = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reset = ref.read(authProvider.notifier);
    final resetWatch = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              CustomBackButton(
                onTap: () {
                  context.pop();
                },
              ),
              SizedBox(height: 28),
              Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 10),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: Color(0xff8391A1),
                ),
              ),
              SizedBox(height: 32),
              CustomTextField(
                hintText: "Enter your email",
                controller: _forgotPasswordController,
                obscureText: false,
              ),
              SizedBox(height: 40),
              CustomButton(
                isLoading: resetWatch.isLoading,
                width: double.infinity,
                text: " Send Link",
                onTap: () async {
                  if (_forgotPasswordController.text.isEmpty) {
                    SecondToastHelper.error("Field cant be empty");
                  } else {
                    await reset.resetPassword(
                      _forgotPasswordController.text.trim(),
                      context,
                    );
                    if (!context.mounted) return;
                    if (AuthNotifier.success) {
                      SecondToastHelper.success("Link Successfully sent");

                      context.pop();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
