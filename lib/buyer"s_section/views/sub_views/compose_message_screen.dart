import 'package:eshop/presentation/components/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes_file/route_paths.dart';
import '../../../vendor_directory/widgets/custom_textfield_3.dart';

class ComposeMessageScreen extends StatelessWidget {
   ComposeMessageScreen({super.key});
 final composedMessageController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child:Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go(RoutePaths.contactUsOptionPage);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new, size: 15),
                    ),
                    const Text(
                      "Send a message",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        fontSize: 18
                      ),

                    ),
                    const Opacity(
                      opacity: 0,
                      child: Icon(Icons.arrow_back_ios_new, size: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Image.asset("assets/images/message.png",height: 120,width: 120,),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomTextField3(
                  hintText: "Enter Your Message",
                  controller: composedMessageController,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomButton(width: double.infinity, text: "Send Message", onTap: (){}),
              )
            ],
          )

      ),
    );
  }
}
