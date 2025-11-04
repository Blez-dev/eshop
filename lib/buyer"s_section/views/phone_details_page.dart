import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/buyer%22s_section/models/savedAdClass.dart';
import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/buyer%22s_section/services/launch_whatsapp.dart';
import 'package:eshop/buyer%22s_section/services/save_ad_repository.dart';
import 'package:eshop/buyer%22s_section/state_manager/savedAdNotifer.dart';
import 'package:eshop/buyer%22s_section/widgets/custom_button_2.dart';
import 'package:eshop/buyer%22s_section/widgets/custom_outlined_button_2.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PhoneDetailsPage extends ConsumerStatefulWidget {
  final ImageClass imageData;
  final LaunchWhatsapp whatsappLauncher = LaunchWhatsapp();
  final SaveAdRepo saveAdRepo = SaveAdRepo();
  final BuyersDatabase buyersDatabase = BuyersDatabase();
  bool adIsSaved;
  final myId = FirebaseAuth.instance.currentUser!.uid;

  PhoneDetailsPage({
    super.key,
    required this.imageData,
    this.adIsSaved = false,
  });

  @override
  ConsumerState<PhoneDetailsPage> createState() => _PhoneDetailsPageState();
}

class _PhoneDetailsPageState extends ConsumerState<PhoneDetailsPage> {
  late bool adIsSaved;

  @override
  void initState() {
    adIsSaved = widget.adIsSaved;
    super.initState();
    Future.microtask(() async {
      List<SavedAd> ads = await widget.saveAdRepo.loadSavedAds();
      bool adExists = ads.any(
        (x) => x.docId == widget.imageData.docId.toString(),
      );
      if (adExists) {
        setState(() {
          adIsSaved = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageData.imageUrl ?? "";
    final phonePrice = widget.imageData.price;
    final savedAdAction = ref.read(savedAdNotifierProvider.notifier);
    final savedAdState = ref.watch(savedAdNotifierProvider);

    return Scaffold(
      backgroundColor: Color(0xffE8ECF4),

      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () async {
                            //check if ad is for the user
                            if (widget.myId == widget.imageData.userId) {
                              SecondToastHelper.error("Can't save your own AD");
                            } else {
                              //fetch the ads saved and check if this ad Id matches any of the field

                              if (savedAdState.isSaved) {
                                savedAdAction.isSavedFalse();
                                SecondToastHelper.error(
                                  "AD Deleted from Saved Section",
                                );
                                //delete AD
                                await widget.buyersDatabase.deleteSavedDoc(
                                  widget.imageData.docId.toString(),
                                  widget.myId,
                                );
                              } else {
                                savedAdAction.isSavedTrue();
                                SecondToastHelper.success(
                                  "AD Successfully added",
                                );
                                //write into the database you checked
                                widget.buyersDatabase.saveAdIntoDatabase(
                                  widget.myId,
                                  widget.imageData.docId.toString(),
                                  widget.imageData.description,
                                  widget.imageData.price,
                                  widget.imageData.brand,
                                  widget.imageData.model,
                                  widget.imageData.ramItem,
                                  widget.imageData.romItem,
                                  widget.imageData.condition,
                                  widget.imageData.location,
                                  widget.imageData.imageUrl!,
                                  widget.imageData.isYes ? "YES" : "NO",
                                  widget.imageData.email!,
                                  widget.imageData.username!,
                                  widget.imageData.whatsappNumber!,
                                  widget.imageData.userId,
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: savedAdState.isSaved
                                    ? Color(0xFFDB3022)
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
                  color: Color(0xffE8ECF4),
                  padding: const EdgeInsets.all(20),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: BoxBorder.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.imageData.location,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.imageData.model,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.imageData.price,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CustomOutlinedButton2(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.35,
                                    text: "Whatsapp",
                                    onTap: () async {
                                      await widget.whatsappLauncher
                                          .launchWhatsapp(
                                            widget.imageData.whatsappNumber!,
                                            widget.imageData.username!,
                                            widget.imageData.model,
                                          );
                                    },
                                  ),
                                  Spacer(),
                                  CustomButton3(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.35,
                                    text: "Call",
                                    onTap: () async {
                                      if(widget.myId == widget.imageData.userId){
                                        SecondToastHelper.error("Can't call yourself");
                                      }else{
                                        await widget.whatsappLauncher.launchCall(
                                          widget.imageData.whatsappNumber!,
                                        );
                                      }

                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: BoxBorder.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Brand",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.imageData.brand,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Condition",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.imageData.condition,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  Text(
                                    "Swappable?",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.imageData.isYes == true
                                        ? "Yes"
                                        : "No",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Ad ID",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.imageData.docId.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    "Vendor",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.imageData.username ?? "Null",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Ram",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.imageData.ramItem,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Rom",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    widget.imageData.romItem,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                  Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: BoxBorder.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            widget.imageData.description,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
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
