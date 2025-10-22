import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadSuccessfulPage extends StatelessWidget {
  const UploadSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(height: 90,),
                Image.asset(
                  "assets/images/uploadSuccessful.jpg",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),

                Text(
                  "Successfully Uploaded",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),
                  SizedBox(height: 19,),
                Text(
                  "Your Item has been successfully uploaded.Manage and view your orders on your dashboard",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff606060),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
Spacer(),
                CustomButton(width: double.infinity, text: "Proceed to Dashboard", onTap: (){
                  context.go(RoutePaths.vendorItemsPage);
                }),
                SizedBox(height: 60,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
