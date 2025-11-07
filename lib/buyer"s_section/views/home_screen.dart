import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/buyer%22s_section/state_manager/price_and_brand_selection_notifier.dart';
import 'package:eshop/buyer%22s_section/state_manager/savedAdNotifer.dart';
import 'package:eshop/buyer%22s_section/widgets/brand_tile.dart';
import 'package:eshop/buyer%22s_section/widgets/price_tile.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:eshop/vendor_directory/services/clothes_database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';


import '../state_manager/profile_state_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(profileStateProvider.notifier).fetchUserInfo();
    });
  }
  final PhonesDatabaseService phones = PhonesDatabaseService();
  final BuyersDatabase marketPhones = BuyersDatabase();
  final  buyerId= FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final selectionState = ref.watch(priceAndBrandProvider);
    final selectionStateAction = ref.read(priceAndBrandProvider.notifier);
    final isSavedAction= ref.read(savedAdNotifierProvider.notifier);
    final isSavedStat= ref.watch(savedAdNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFA6A6),
        title: SizedBox(
          height: 45.h,
          width: MediaQuery.of(context).size.width * 0.65.w,
          child: TextField(
            onChanged: (value) {
              selectionStateAction.setBrandStatus(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.grey,
              hintText: "Search for phone\"S brand ",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey, width: 1.w),
              ),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 5.w),

      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),


            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image(
                image: AssetImage("assets/images/phonesBanner.png"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120.h,
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16.w),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            selectionStateAction.lessThan100();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 100000
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              "< #100k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.lessThan400();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 400000
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              "< #400k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.lessThan700();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 700000
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              "< #700k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.lessThan1M();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 1000000
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              "< #1M",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.lessThanOnePoint5M();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 1500000
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              "< #1.5M",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.onePoint5MAbove();
                          },
                          child: PriceTile(
                            borderColor: selectionState.priceFlag == 1500001
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Text(
                              " #1.5M and above",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //apple Tile
                        InkWell(
                          onTap: () {
                            selectionStateAction.applePicked();
                          },
                          child: BrandTile(
                            borderWidthColor:
                                selectionState.brandPickedStatus == "Apple"
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),

                            child: Column(
                              children: [
                                SizedBox(height: 13.h),
                                Image.asset(
                                  "assets/images/apple.png",
                                  height: 25.h,
                                  width: 25.w,
                                ),

                                Expanded(
                                  child: Text(
                                    "Apple",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        //samsung Tile
                        InkWell(
                          onTap: () {
                            selectionStateAction.samsungPicked();
                          },
                          child: BrandTile(
                            borderWidthColor:
                                selectionState.brandPickedStatus == "Samsung"
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),

                            child: Column(
                              children: [
                                SizedBox(height: 13.h),
                                Image.asset("assets/images/samsung2.png"),

                                Expanded(
                                  child: Text(
                                    "Samsung",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        //Techno Tile
                        InkWell(
                          onTap: () {
                            selectionStateAction.technoPicked();
                          },
                          child: BrandTile(
                            borderWidthColor:
                                selectionState.brandPickedStatus == "Techno"
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                Image.asset(
                                  "assets/images/techno.png",
                                  height: 40.h,
                                  width: 40.w,
                                ),

                                Expanded(
                                  child: Text(
                                    "Techno",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.xiaomiPicked();
                          },
                          child: BrandTile(
                            borderWidthColor:
                                selectionState.brandPickedStatus == "Xiaomi"
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Column(
                              children: [
                                SizedBox(height: 13.h),

                                 Image(
                                  image: AssetImage("assets/images/xiaomi.png"),
                                  height: 25.h,
                                  width: 23.w,
                                ),

                                Expanded(
                                  child: Text(
                                    "Xiaomi",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            selectionStateAction.infinixPicked();
                          },
                          child: BrandTile(
                            borderWidthColor:
                                selectionState.brandPickedStatus == "Infinix"
                                ? Color(0xffFFA6A6)
                                : Color(0xffE8ECF4),
                            child: Column(
                              children: [
                                SizedBox(height: 13.h),
                                Image.asset(
                                  "assets/images/infinix.png",
                                  height: 35.h,
                                  width: 35.w,
                                ),

                                Expanded(
                                  child: Text(
                                    "Infinix",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: StreamBuilder(
                stream: marketPhones.getPhoneItemsByBrandAndPrice(
                  selectionState.priceFlag ?? 0,
                  selectionState.brandPickedStatus ?? "",
                ),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child:  SpinKitFadingCircle(
                      color: Colors.black,
                      size: 25.sp,
                    ),);
                  }
                  if (snapshot.hasError) {
                    return Text("Error occured");
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text("No data yet");
                  }
                  final data = snapshot.data!.docs;
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      // Get available width for dynamic adjustment
                      final screenWidth = constraints.maxWidth;
                      final crossAxisCount = 2;
                      final spacing = 8 * (crossAxisCount - 1);
                      final usableWidth = screenWidth - spacing;
                      final itemWidth = usableWidth / crossAxisCount;

                      // Dynamic aspect ratio (height ~1.4x of width)
                      final itemHeight = itemWidth * 1.7.h;

                      return GridView.builder(
                        padding:  EdgeInsets.all(8.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 8.h,
                          crossAxisSpacing: 8.w,
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final dataItem =
                              data[index].data() as Map<String, dynamic>;
                          ImageClass useMe = ImageClass.fromJson(dataItem);

                          return InkWell(
                            onTap: () async{
                              final adExists= await marketPhones.checkAd(buyerId, useMe.docId.toString());
                             if(adExists){
                               isSavedAction.isSavedTrue();

                               if(!context.mounted) return;

                               context.push(RoutePaths.phoneDetailsPage,extra: useMe);
                             }else{
                               isSavedAction.isSavedFalse();

                               if(!context.mounted) return;

                               context.push(RoutePaths.phoneDetailsPage,extra: useMe);
                             }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffE8ECF4),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 🖼 Product image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: useMe.imageUrl == null
                                        ? Container(
                                            height:
                                                itemWidth, // square image area
                                            width: double.infinity,
                                            color: Colors.grey[300],
                                            child: const Icon(
                                              Icons.image_not_supported,
                                            ),
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: useMe.imageUrl!,
                                            fit: BoxFit.cover,
                                            height: itemWidth,
                                            width: double.infinity,
                                            progressIndicatorBuilder:
                                                (
                                                  context,
                                                  url,
                                                  progress,
                                                ) => Center(
                                                  //put a spin kit here
                                                  child:
                                                  SpinKitFadingCircle(
                                                    color: Colors.black,
                                                    size: 25.sp,
                                                  ),
                                                ),
                                            errorWidget: (context, url, error) =>
                                                const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                ),
                                          ),
                                  ),

                                   SizedBox(height: 6.h),

                                  // 🏷 Product name
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                    ),
                                    child: Text(
                                      useMe.model,
                                      style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  // 📦 Category
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          useMe.condition,
                                          style:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),


                                        Text(
                                          useMe.location,
                                          style:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],

                                    ),
                                  ),

                                  // 💰 Price
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                    ),
                                    child: Text(
                                      useMe.price,
                                      style:  TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
