import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/buyer%22s_section/services/buyer%22s_phone_database.dart';
import 'package:eshop/buyer%22s_section/widgets/brand_tile.dart';
import 'package:eshop/buyer%22s_section/widgets/price_tile.dart';
import 'package:eshop/vendor_directory/model/image_class.dart';
import 'package:eshop/vendor_directory/services/clothes_database_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PhonesDatabaseService phones = PhonesDatabaseService();
  final BuyersDatabase marketPhones= BuyersDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFA6A6),
        title: SizedBox(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.65,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.grey,
              hintText: "Search for phone",
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 5),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),

              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#0 - 100k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#100k - #200k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#200k - #300k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#300k - 400k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#400k - 500k",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: PriceTile(
                            child: Text(
                              "#500k and above",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BrandTile(
                          child: Column(
                            children: [
                              SizedBox(height: 13),
                              Image.asset(
                                "assets/images/apple.png",
                                height: 25,
                                width: 25,
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
                        SizedBox(width: 10),
                        BrandTile(
                          child: Column(
                            children: [
                              SizedBox(height: 13),
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
                        SizedBox(width: 10),
                        BrandTile(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                "assets/images/techno.png",
                                height: 40,
                                width: 40,
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
                        SizedBox(width: 10),
                        BrandTile(
                          child: Column(
                            children: [
                              SizedBox(height: 13),
                              Image.asset(
                                "assets/images/xiaomi.png",
                                height: 25,
                                width: 25,
                              ),

                              Text(
                                "Xiaomi",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        BrandTile(
                          child: Column(
                            children: [
                              SizedBox(height: 13),
                              Image.asset(
                                "assets/images/infinix.png",
                                height: 35,
                                width: 35,
                              ),

                              Text(
                                "Infinix",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
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
                stream: marketPhones.getPhoneItems(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("waiting");
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
                      final itemHeight = itemWidth * 1.4;

                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final dataItem = data[index].data() as Map<String, dynamic>;
                          ImageClass useMe = ImageClass.fromJson(dataItem);

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 🖼 Product image
                                ClipRRect(
                                  borderRadius:  BorderRadius.circular(10),
                                  child: useMe.imageUrl == null
                                      ? Container(
                                    height: itemWidth, // square image area
                                    width: double.infinity,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.image_not_supported),
                                  )
                                      : CachedNetworkImage(
                                    imageUrl: useMe.imageUrl!,
                                    fit: BoxFit.cover,
                                    height: itemWidth,
                                    width: double.infinity,
                                    progressIndicatorBuilder: (context, url, progress) =>
                                        Center(child: CircularProgressIndicator(value: progress.progress)),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error, color: Colors.red),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // 🏷 Product name
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    useMe.model,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                // 📦 Category
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    useMe.location,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                // 💰 Price
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: Text(
                                    useMe.price,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
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
