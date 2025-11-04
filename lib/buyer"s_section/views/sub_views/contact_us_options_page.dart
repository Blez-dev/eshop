import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../routes_file/route_paths.dart';
import '../../widgets/icon_tile.dart';

class ContactUsOptionsPage extends StatelessWidget {
  const ContactUsOptionsPage({super.key});

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
                      context.go(RoutePaths.profilePage);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 15),
                  ),
                  const Text(
                    "Contact Us Via",
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

            // First contact option
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                height: 65,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: const [
                    IconTile(iconTileWidget: Icon(FontAwesomeIcons.whatsapp)),
                    SizedBox(width: 15),
                    Text(
                      "Contact Via Whatsapp",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 15),
                  ],
                ),
              ),
            ),

            // Second contact option
            GestureDetector(
              onTap: (){
                context.push(RoutePaths.composeMessagePage);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: const [
                      IconTile(iconTileWidget: Icon(FontAwesomeIcons.comment,size: 18,)),
                      SizedBox(width: 15),
                      Text(
                        "Compose a Message",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
