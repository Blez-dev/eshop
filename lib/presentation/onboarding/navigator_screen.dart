import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_outlined_button.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withValues(alpha: 0.05), // dim strength
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    "assets/images/backgroundImg.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 160,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomButton(width: double.infinity, text: "Login", onTap: (){
                          context.push(RoutePaths.signIn);
                        }),
                      ),


                    ],
                  )),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: 80,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomOutlinedButton(width: double.infinity, text: "Sign up", onTap: (){
                          context.push(RoutePaths.signUp);
                        }),
                      ),


                    ],
                  ))

            ],
          )
      ),
    );
  }
}
