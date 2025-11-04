import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_text_field.dart';
import 'package:eshop/vendor_directory/widgets/custom_textfield_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../routes_file/route_paths.dart';

class ReportAdPage extends StatelessWidget {
  ReportAdPage({super.key});

  final _adNumberController = TextEditingController();
  final _adReportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(RoutePaths.reportOptionsPage);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                  const Text(
                    "Report Ad",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Image.asset("assets/images/reportIcon.png", height: 120, width: 120),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14,
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
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey, // border color
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red, // border color when focused
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: CustomButton(
                width: double.infinity,
                text: "Report Ad",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
