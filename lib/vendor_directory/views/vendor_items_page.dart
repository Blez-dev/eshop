import 'package:eshop/presentation/components/button.dart';
import 'package:eshop/presentation/components/custom_circular_bar.dart';
import 'package:eshop/presentation/components/custom_outlined_button.dart';
import 'package:eshop/routes_file/route_paths.dart';
import 'package:eshop/vendor_directory/model/clothes_user_model.dart';
import 'package:eshop/vendor_directory/services/clothes_database_service.dart';
import 'package:eshop/vendor_directory/widgets/custom_circular_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class VendorItemsPage extends StatefulWidget {
  const VendorItemsPage({super.key});

  @override
  State<VendorItemsPage> createState() => _VendorItemsPageState();
}

class _VendorItemsPageState extends State<VendorItemsPage> {
  final clothesDB = ClothesDatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffF9F9F9),
        title: Text("Your Active Ads", style: TextStyle(color: Colors.red)),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: clothesDB.getDocs("clothes"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: SpinKitFadingCircle(color: Colors.black,size: 25,));
            }
            if (snapshot.hasError) {
              //The text not showing, might be the color
              return Center(child: Text("An error has occurred"));
            }
            //The text not showing, might be the color

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("An Data Available yet"));
            }

            final clothesDataList = snapshot.data!.docs;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: clothesDataList.length,
                    itemBuilder: (context, index) {
                      var data =
                          clothesDataList[index].data() as Map<String, dynamic>;

                      ClothesUserModel clothData = ClothesUserModel.fromJson(
                        data,
                      );

                      String docId= clothesDataList[index].id;

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
                                child: clothData.image == null
                                    ? const SizedBox()
                                    : CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: SpinKitFadingCircle(color: Colors.black,size: 25,),
                                            ),
                                        fit: BoxFit.cover,
                                        imageUrl: clothData.image!,
                                      ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  clothData.name!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  clothData.description!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  clothData.price!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),

                                Text(
                                  DateFormat(
                                    "yyyy-MM-dd  HH:mm",
                                  ).format(clothData.createdOn!.toDate()),
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
                                IconButton(onPressed: (){
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text("Delete Ad"),
                                      content: Text("Deleting this ad also deletes it from the main market",style: TextStyle(color: Colors.grey),),
                                      actions: [
                                        CustomButton(width: double.infinity, text: "Delete", onTap: (){
                                          clothesDB.deleteDoc(docId, "clothes");
                                          context.pop();
                                        }),
                                        SizedBox(height: 10,),
                                        CustomOutlinedButton(width: double.infinity, text: "Cancel", onTap: (){context.pop();})
                                      ],
                                    );
                                  });
                                }, icon: Icon(Icons.delete_outline),color: Color(0xFFDB3022),)
                              ],
                            )
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
          context.go(RoutePaths.addItemsPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
