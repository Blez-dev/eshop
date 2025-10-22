import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state.dart';
import 'package:eshop/presentation/onboarding/navigator_screen.dart';
import 'package:eshop/presentation/onboarding/onboarding_screen.dart';
import 'package:eshop/presentation/onboarding/sign_in_screen.dart';
import 'package:eshop/presentation/onboarding/sign_up_screen.dart';
import 'package:eshop/vendor_directory/views/vendor_items_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthControllerStateScreen extends StatefulWidget {
  const AuthControllerStateScreen({super.key});

  @override
  State<AuthControllerStateScreen> createState() =>
      _AuthControllerStateScreenState();
}

class _AuthControllerStateScreenState extends State<AuthControllerStateScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Widget> fetchScreen() async {
    bool? isLoggedIn = await AuthController.getLoginState();
    bool? isVendor = await AuthController.getVendorRole();
    bool? isBuyer = await AuthController.getBuyerRole();
    bool? isFirstTime = await AuthController.getState();

    if (isFirstTime == true) {
      return OnboardingScreen();
    } else if (isFirstTime == false && isLoggedIn == false) {
      print(isLoggedIn);
      print(isVendor);
      print(isBuyer);
      print(isFirstTime);
      return SigninScreen();
    } else if (isFirstTime == false && isLoggedIn == true && isVendor == true) {
      return VendorItemsPage();
    } else if (isFirstTime == false && isLoggedIn == true && isBuyer == true) {
      return SignUpScreen();
    } else {
      return OnboardingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CustomCircularBar()));
        }

        if (snapshot.hasData) {
          return snapshot.data as Widget;
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("An error has occured, pls restart app")),
          );
        }

        return Scaffold(body: Center(child: Text("Something went wrong")));
      },
    );
  }
}
