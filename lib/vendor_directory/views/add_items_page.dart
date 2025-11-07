import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:eshop/presentation/components/custom_outlined_button.dart';
import 'package:eshop/presentation/components/flutter_toast.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/routes_file/routes.dart';
import 'package:eshop/vendor_directory/state_manager/image_picker_notifier.dart';
import 'package:eshop/vendor_directory/widgets/button_field.dart';
import 'package:eshop/vendor_directory/widgets/custom_textfield_2.dart';
import 'package:eshop/vendor_directory/widgets/custom_textfield_3.dart';

import 'package:eshop/vendor_directory/widgets/image_container.dart';
import 'package:eshop/vendor_directory/widgets/phone_condition_dropdown.dart';
import 'package:eshop/vendor_directory/widgets/ram_dropdown.dart';
import 'package:eshop/vendor_directory/widgets/rom_dropdown.dart';
import 'package:eshop/vendor_directory/widgets/size_tile.dart';
import 'package:eshop/vendor_directory/widgets/upload_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class AddItemsPage extends ConsumerStatefulWidget {
  const AddItemsPage({super.key});

  @override
  ConsumerState<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends ConsumerState<AddItemsPage> {
  final List<String> categories = ['roundnecks', 'Jeans', 'Shirts'];
  final List<String> romCategories = ['64 GB', '128 GB', '256 GB',"512 GB", "1 TB"];
  final List<String> ramCategories = ['1 GB', '2 GB', '4 GB',"6 GB", "12 GB"];
  final List<String> phoneCondition = ['New', 'Fairly Used', 'Uk Used', "Refurbished"];
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageProvider = ref.watch(postAddStateNotifier);
    final imageStateReader = ref.read(postAddStateNotifier.notifier);
    final adFieldName= ref.watch(postAddStateNotifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Post Ad"),
        backgroundColor:  Color(0xffFFA6A6),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                //IMAGE CONTAINER BELOW
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 350.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0.r),
                            child: Column(
                              children: [
                                Text(
                                  "Pick Image From",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(height: 30.h),
                                CustomButton(
                                  width: double.infinity,
                                  text: "Camera",
                                  onTap: () {
                                    imageStateReader.pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                ),
                                SizedBox(height: 30.h),
                                CustomOutlinedButton(
                                  width: double.infinity,
                                  text: "Gallery",
                                  onTap: () {
                                    imageStateReader.pickImageFromGallery();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: imageProvider.image == null
                      ? ImageContainer(
                          imageWidget: Center(
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: ImageContainer(
                            imageWidget: Image.file(
                              width: double.infinity,
                              height: double.infinity,
                              imageProvider.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                //Title reusable container below

                SizedBox(height: 20.h),



                SizedBox(height: 20.h),
                InkWell(child: ButtonField(title: "Brand: ",pickedOption: adFieldName.brand,),onTap: (){
                        context.push(RoutePaths.brandPage);
                },),
                SizedBox(height: 20.h),
                InkWell(child: ButtonField(title: "Model: ",pickedOption: adFieldName.isBrandChanged?" ":adFieldName.model,),onTap: (){
                  if(adFieldName.brandSelection==true){
                    context.push(RoutePaths.modelPage);
                  }else{

                    SecondToastHelper.error("Brand needs to be selected first");
                  }
                },),
                SizedBox(height: 20.h),
                RamDropdown(categories: ramCategories, hintText: "Select Ram"),
                SizedBox(height: 20.h),
                RomDropdown(categories: romCategories, hintText: "Select Rom"),
                SizedBox(height: 20.h),
                PhoneConditionDropdown(categories: phoneCondition, hintText: "Specify Condition"),
                SizedBox(height: 20.h),
                InkWell(child: ButtonField(title: "Location: ",pickedOption: adFieldName.location,),onTap: (){
                  context.push(RoutePaths.locationPage);
                },),
                SizedBox(height: 20.h),
                CustomTextField3(
                  hintText: "Enter Description of Phone",
                  controller: _descriptionEditingController,
                  keyboardType: TextInputType.multiline,
                  obscureText: false,
                ),

                SizedBox(height: 20.h),
                CustomTextField2(

                  hintText: "Enter Price of item",
                  controller: _priceEditingController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.h),



                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Swap Possible ? ",
                    style: TextStyle(color: Colors.black, fontSize: 20.sp),
                  ),
                ),
                SizedBox(height: 10.h),


                //Row for swappable yes/no question
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          imageStateReader.yesToggleSwapOption();
                        },
                        child: SizeTile(
                          size: "YES",
                          borderColor: imageProvider.isYes
                              ? Colors.white
                              : Colors.grey,
                          textColor: imageProvider.isYes
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: imageProvider.isYes
                              ? Color.fromRGBO(219, 48, 34, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          imageStateReader.noToggleSwapOption();
                        },
                        child: SizeTile(
                          size: "NO",
                          borderColor: imageProvider.isNo
                              ? Colors.white
                              : Colors.grey,
                          textColor: imageProvider.isNo
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: imageProvider.isNo
                              ? Color.fromRGBO(219, 48, 34, 1)
                              : Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),

                  ],
                ),

                SizedBox(height: 40.h),
                CustomButton2(
                  width: double.infinity,
                  onTap: imageProvider.isLoading!
                      ? () {}
                      : () async {
                    showDialog(context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return PopScope(
                              canPop: false,
                              child: SpinKitFadingCircle(
                              color: Colors.black, size: 40.sp));
                        });
                          await imageStateReader.uploadItem(

                            _priceEditingController.text.trim(),
                            _descriptionEditingController.text.trim(),

                          );

                          if (!context.mounted) return;
                          final latestState = ref.read(postAddStateNotifier);
                          if (latestState.uploadSuccess == true) {
                            context.go(RoutePaths.uploadSuccessfulPage);
                          } else {
                            SecondToastHelper.error("Upload failed");
                            context.pop();
                          }
                        },
                  txt: imageProvider.isLoading!
                      ? CustomCircularBar()
                      : Text(
                          "Upload Item",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
