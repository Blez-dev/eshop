

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/buyer%22s_section/state_manager/saved_item_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/components/button.dart';
import '../../presentation/components/custom_outlined_button.dart';
import '../../vendor_directory/services/clothes_database_service.dart';
import '../models/savedAdModel.dart';
import '../services/buyer"s_phone_database.dart';

class SavedAdPage extends ConsumerStatefulWidget {
  const SavedAdPage({super.key});

  @override
  ConsumerState<SavedAdPage> createState() => _SavedAdPageState();
}

class _SavedAdPageState extends ConsumerState<SavedAdPage> {
  final phonesDB = PhonesDatabaseService();
  final marketPhoneDb = BuyersDatabase();
  final myId=FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    final stateDeleteReader= ref.read(buyersStateProvider.notifier);
    final stateDeleteWatcher= ref.watch(buyersStateProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF9F9F9),
        title: Text("Your Saved Ads", style: TextStyle(color: Colors.red)),

      ),
      body: SafeArea(
        child: stateDeleteWatcher.isDeleting?
        Center(child: SpinKitFadingCircle(color: Colors.black, size: 25),):
        StreamBuilder(
          stream: marketPhoneDb.getIndividualSaved(myId),
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
                  "No Saved Ad yet",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
              );
            }

            final savedPhonesDatas = snapshot.data!.docs;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: savedPhonesDatas.length,
                    itemBuilder: (context, index) {
                      var data =
                      savedPhonesDatas[index].data() as Map<String, dynamic>;

                      SavedAdPhones savedPhoneData = SavedAdPhones.fromJson(data);

                      String docId = savedPhonesDatas[index].id;

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
                                child: savedPhoneData.imageUrl == null
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
                                  imageUrl: savedPhoneData.imageUrl,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  savedPhoneData.model,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  savedPhoneData.condition,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  savedPhoneData.price,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),

                                Text(
                                  savedPhoneData.username,
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
                                              onTap: () async{
                                                 stateDeleteReader.deleteFromAllUser(savedPhoneData.docId, myId);
                                                if (!context.mounted) return;
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

    );
  }
}
