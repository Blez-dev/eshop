import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/data/services/firebase_auth_state_notifier.dart';
import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:eshop/presentation/components/custom_outlined_button.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/vendor_directory/model/clothes_user_model.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:eshop/vendor_directory/services/clothes_database_service.dart';
import 'package:eshop/vendor_directory/widgets/custom_circular_bar_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../presentation/onboarding/controller/auth_controller_state.dart';

class VendorItemsPage extends ConsumerStatefulWidget {
  const VendorItemsPage({super.key});

  @override
  ConsumerState<VendorItemsPage> createState() => _VendorItemsPageState();
}

class _VendorItemsPageState extends ConsumerState<VendorItemsPage> {
  final myId = FirebaseAuth.instance.currentUser!.uid;
  final phonesDB = PhonesDatabaseService();
  final marketPhoneDb = BuyersDatabase();
  bool isDeleting = false;
  List<PopupMenuItem> popItems = [
    PopupMenuItem(
      value: "switch",
      child: Row(
        children: [
          Icon(Icons.swap_horiz_outlined),
          SizedBox(width: 15),
          Text("Switch to Market Place"),
        ],
      ),
    ),

    PopupMenuItem(
      value: "logout",
      child: Row(
        children: [Icon(Icons.logout), SizedBox(width: 15), Text("Logout")],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final logoutAction = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF9F9F9),
        title: Text("Your Active Ads", style: TextStyle(color: Colors.red)),
        actions: [
          PopupMenuButton(
            color: Colors.white,
            onSelected: (value) async {
              if (value == "switch") {
                //blah blah blah
                AuthController.setVendorRole("isVendor", false);
                AuthController.setBuyerRole("isBuyer", true);
                context.go(RoutePaths.homePage);
              } else {
                await logoutAction.signout();
                if (!context.mounted) return;
                context.go(RoutePaths.navigator);
              }
            },
            itemBuilder: (context) {
              return popItems;
            },
          ),
        ],
      ),
      body: SafeArea(
        child: isDeleting
            ? Center(child: SpinKitFadingCircle(color: Colors.black, size: 25))
            : StreamBuilder(
                stream: phonesDB.getDocs("phones"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCircle(color: Colors.black, size: 25),
                    );
                  }
                  if (snapshot.hasError) {
                    //The text not showing, might be the color
                    return Center(
                      child: Text(
                        "An error has occurred",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    );
                  }
                  //The text not showing, might be the color

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        "No Ad Available yet",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }

                  final phonesDataList = snapshot.data!.docs;

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: phonesDataList.length,
                          itemBuilder: (context, index) {
                            var data =
                                phonesDataList[index].data()
                                    as Map<String, dynamic>;

                            ImageClass adData = ImageClass.fromJson(data);

                            String docId = phonesDataList[index].id;

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              height: 104,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      height: 104,
                                      width: 104,
                                      child: adData.imageUrl == null
                                          ? const SizedBox()
                                          : CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  const SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: SpinKitFadingCircle(
                                                      color: Colors.black,
                                                      size: 25,
                                                    ),
                                                  ),
                                              fit: BoxFit.cover,
                                              imageUrl: adData.imageUrl!,
                                            ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        adData.model,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        adData.condition,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        adData.price,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),

                                      Text(
                                        DateFormat(
                                          "yyyy-MM-dd  HH:mm",
                                        ).format(adData.createdOn!.toDate()),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text("Delete Ad"),
                                                content: Text(
                                                  "Deleting this ad also deletes it from the main market",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                actions: [
                                                  CustomButton(
                                                    width: double.infinity,
                                                    text: "Delete",
                                                    onTap: () async {
                                                      setState(() {
                                                        isDeleting = true;
                                                      });
                                                      marketPhoneDb
                                                          .deleteAllSavedAds(
                                                            adData.docId
                                                                .toString(),
                                                          );
                                                      phonesDB.deleteDoc(
                                                        docId,
                                                        "phones",
                                                      );
                                                      marketPhoneDb.deleteDoc(
                                                        docId,
                                                        "market",
                                                      );
                                                      setState(() {
                                                        isDeleting = false;
                                                      });
                                                      if (!context.mounted)
                                                        return;
                                                      context.pop();
                                                    },
                                                  ),
                                                  SizedBox(height: 10),
                                                  CustomOutlinedButton(
                                                    width: double.infinity,
                                                    text: "Cancel",
                                                    onTap: () {
                                                      context.pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.delete_outline),
                                        color: Color(0xFFDB3022),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFDB3022),
        onPressed: () {
          context.push(RoutePaths.addItemsPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
