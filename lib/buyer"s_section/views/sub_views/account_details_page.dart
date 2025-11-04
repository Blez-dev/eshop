import 'package:eshop/buyer%22s_section/widgets/info_details_page.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f8f9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(RoutePaths.profilePage);
                    },
                    icon: Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                  Text("Account Info", style: TextStyle(color: Colors.black)),
                  Opacity(
                    opacity: 0,
                    child: Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xffFFA6A6),
                  border: BoxBorder.all(color: Colors.white, width: 8),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(child: Image.asset("assets/images/avatar.png")),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username", style: TextStyle(color: Color(0xff222222))),
                  SizedBox(height: 10),
                  InfoDetailsPage(childWidget: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10,),
                      Text("Blezant",style: TextStyle(color: Colors.black,letterSpacing: 1.2),)
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(color: Color(0xff222222))),
                  SizedBox(height: 10),
                  InfoDetailsPage(childWidget: Row(
                    children: [
                      Icon(Icons.email_outlined,size: 20,),
                      SizedBox(width: 10,),
                      Text("blessingadu97@gmail.com",style: TextStyle(color: Colors.black,letterSpacing: 1.2),)
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Number", style: TextStyle(color: Color(0xff222222))),
                  SizedBox(height: 10),
                  InfoDetailsPage(childWidget: Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10,),
                      Text("+2348168463261",style: TextStyle(color: Colors.black,letterSpacing: 1.2),)
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
