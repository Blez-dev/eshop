import 'package:eshop/vendor_directory/state_manager/image_picker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BrandPage extends ConsumerStatefulWidget {
   const BrandPage({super.key});

  @override
  ConsumerState<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends ConsumerState<BrandPage> {
  final List<String> brandNames = const ["Apple","Samsung","Techno","Infinix", "Xiaomi"];

  @override
  Widget build(BuildContext context) {
    final setBrand= ref.read(postAddStateNotifier.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA6A6),
        centerTitle: true,
        title: Text("Select a Brand", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: [



              Container(
                height: 30,
                width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffffecec)
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("POPULAR", style: TextStyle(color: Colors.black)))),

            Expanded(
              child: ListView.builder(
                  itemCount: brandNames.length,
                  itemBuilder: (context,index){
                    final brandName = brandNames[index];
                return InkWell(
                  child:Column(
                    children: [
                      ListTile(
                        title: Text(brandName,style: TextStyle(color: Colors.black),),
                        onTap: (){
                          setBrand.setBrand(brandName);
                          setBrand.setBrandChangeValue(true);
                          setBrand.setBrandSelectedValue(true);
                          context.pop();
                        },
                      ),
                      Divider(thickness: 0.5,
                      color: Color(0xff),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
