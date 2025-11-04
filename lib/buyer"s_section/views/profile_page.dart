import 'package:eshop/buyer%22s_section/widgets/profile_cards.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/onboarding/controller/auth_controller_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xffFFA6A6)),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text("Profile", style: TextStyle(fontSize: 24)),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 8,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Image.asset("assets/images/avatar.png"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blezant",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "blessingadu97@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
                ),
                child: Container(
                  padding: EdgeInsets.all(40),
                  height: MediaQuery.of(context).size.height*0.6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xfff7f8f9),

                  ),
                  child: Column(
                    children: [
                    InkWell(
                      onTap: (){
                        context.push(RoutePaths.accountDetailsPage);
                      },
                        child: CustomProfileChip(iconTileWidget: Icon(Icons.account_circle,color: Color(0xFFDB3022),),text: "Account",)),
                      Container(

                        decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.grey,
                              width: 0.5,

                            )
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            AuthController.setVendorRole("isVendor", true);
                            AuthController.setBuyerRole("isBuyer", false);
                            context.go(RoutePaths.vendorItemsPage);
                          },
                          child: CustomProfileChip(iconTileWidget: Icon(Icons.swap_horiz_outlined,color: Color(0xFFDB3022)),text: "Switch to vendor's section",)),
                      Container(

                        decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.grey,
                              width: 0.5,

                            )
                        ),
                      ),
                      InkWell(

                          onTap: (){
                            context.push(RoutePaths.contactUsOptionPage);
                          },
                          child: CustomProfileChip(iconTileWidget: Icon(Icons.phone,color: Color(0xFFDB3022)),text: "Contact us")),
                      Container(

                        decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.grey,
                              width: 0.5,

                            )
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            context.push(RoutePaths.reportOptionsPage);
                          },
                          child: CustomProfileChip(iconTileWidget: Icon(Icons.flag,color: Color(0xFFDB3022)),text: "Report a Vendor/Ad")),
                      Container(

                        decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.grey,
                              width: 0.5,

                            )
                        ),
                      ),
                      CustomProfileChip(iconTileWidget: Icon(Icons.delete_outline,color: Color(0xFFDB3022)),text: "Delete Account"),
                      Container(

                        decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.grey,
                              width: 0.5,

                            )
                        ),
                      ),
                      CustomProfileChip(iconTileWidget: Icon(Icons.logout,color: Color(0xFFDB3022)),text: "Logout"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
