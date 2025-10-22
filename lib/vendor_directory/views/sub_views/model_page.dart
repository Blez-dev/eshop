import 'package:eshop/vendor_directory/state_manager/image_picker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ModelPage extends ConsumerStatefulWidget {
  const ModelPage({super.key});

  @override
  ConsumerState<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends ConsumerState<ModelPage> {
  final List<String> appleModels = [
    "iPhone 6",
    "iPhone 6 Plus",
    "iPhone 6s",
    "iPhone 6s Plus",
    "iPhone SE (1st generation)",
    "iPhone 7",
    "iPhone 7 Plus",
    "iPhone 8",
    "iPhone 8 Plus",
    "iPhone X",
    "iPhone XR",
    "iPhone XS",
    "iPhone XS Max",
    "iPhone 11",
    "iPhone 11 Pro",
    "iPhone 11 Pro Max",
    "iPhone SE (2nd generation)",
    "iPhone 12",
    "iPhone 12 mini",
    "iPhone 12 Pro",
    "iPhone 12 Pro Max",
    "iPhone 13",
    "iPhone 13 mini",
    "iPhone 13 Pro",
    "iPhone 13 Pro Max",
    "iPhone 14",
    "iPhone 14 Plus",
    "iPhone 14 Pro",
    "iPhone 14 Pro Max",
    "iPhone 15",
    "iPhone 15 Plus",
    "iPhone 15 Pro",
    "iPhone 15 Pro Max",
    "iPhone 16",
    "iPhone 16 Plus",
    "iPhone 16e",
    "iPhone 17",
    "iPhone 17 Pro",
    "iPhone 17 Pro Max",
    "iPhone Air",
  ];
  final List<String> samsungModels = [
    "Galaxy A10e",
    "Galaxy A20s",
    "Galaxy A24",
    "Galaxy A25 5G",
    "Galaxy A30s",
    "Galaxy A35 5G",
    "Galaxy A36 5G",
    "Galaxy A50s",
    "Galaxy A52 5G",
    "Galaxy A53 5G",
    "Galaxy A54 5G",
    "Galaxy A55 5G",
    "Galaxy F02s",
    "Galaxy F04",
    "Galaxy F13",
    "Galaxy F22",
    "Galaxy F23 5G",
    "Galaxy F34 5G",
    "Galaxy F36 5G",
    "Galaxy M10",
    "Galaxy M10s",
    "Galaxy M20",
    "Galaxy M21",
    "Galaxy M30s",
    "Galaxy M31",
    "Galaxy M36 5G",
    "Galaxy S10",
    "Galaxy S10e",
    "Galaxy S10+",
    "Galaxy S20",
    "Galaxy S20 FE",
    "Galaxy S20 Ultra",
    "Galaxy S21",
    "Galaxy S21 FE",
    "Galaxy S21 Ultra",
    "Galaxy S22",
    "Galaxy S22+",
    "Galaxy S22 Ultra",
    "Galaxy S23",
    "Galaxy S23+",
    "Galaxy S23 Ultra",
    "Galaxy Z Flip",
    "Galaxy Z Flip 4",
    "Galaxy Z Flip 5",
    "Galaxy Z Fold",
    "Galaxy Z Fold 4",
    "Galaxy Z Fold 5",
  ];
  final List<String> xiaomiModels = [
    "Mi 9",
    "Mi 9 SE",
    "Mi 9T",
    "Mi 9T Pro",
    "Mi 10",
    "Mi 10 Lite",
    "Mi 10 Pro",
    "Mi 10T",
    "Mi 10T Lite",
    "Mi 10T Pro",
    "Mi 11",
    "Mi 11 Lite",
    "Mi 11 Pro",
    "Mi 11 Ultra",
    "Mi Note 10",
    "Mi Note 10 Lite",
    "Mi Mix 3 5G",
    "Mi Mix 4",
    "Mi Mix Fold",
    "Poco C31",
    "Poco F2 Pro",
    "Poco F3",
    "Poco F4",
    "Poco F5",
    "Poco F5 Pro",
    "Poco M2",
    "Poco M2 Pro",
    "Poco M3",
    "Poco M3 Pro 5G",
    "Poco M4",
    "Poco M4 Pro",
    "Poco M5",
    "Poco M5s",
    "Poco X2",
    "Poco X3",
    "Poco X3 GT",
    "Poco X3 NFC",
    "Poco X4 Pro 5G",
    "Poco X5",
    "Poco X5 Pro",
    "Poco X6",
    "Poco X6 Pro",
    "Redmi 10",
    "Redmi 10A",
    "Redmi 10C",
    "Redmi 11 Prime",
    "Redmi 12",
    "Redmi 12C",
    "Redmi 13 5G",
    "Redmi K20",
    "Redmi K20 Pro",
    "Redmi K30",
    "Redmi K30 Pro",
    "Redmi K40",
    "Redmi K40 Pro",
    "Redmi K50",
    "Redmi K50i",
    "Redmi K60",
    "Redmi K60 Pro",
    "Redmi K70",
    "Redmi K70 Pro",
    "Redmi K70 Ultra",
    "Redmi Note 8",
    "Redmi Note 8 Pro",
    "Redmi Note 9",
    "Redmi Note 9 Pro",
    "Redmi Note 10",
    "Redmi Note 10 Pro",
    "Redmi Note 11",
    "Redmi Note 11 Pro",
    "Redmi Note 11 Pro+",
    "Redmi Note 12",
    "Redmi Note 12 5G",
    "Redmi Note 12 Pro",
    "Redmi Note 12 Pro+",
    "Redmi Note 13",
    "Redmi Note 13 5G",
    "Redmi Note 13 Pro",
    "Redmi Note 13 Pro+",
    "Xiaomi 11T",
    "Xiaomi 11T Pro",
    "Xiaomi 12",
    "Xiaomi 12 Pro",
    "Xiaomi 12T",
    "Xiaomi 12T Pro",
    "Xiaomi 13",
    "Xiaomi 13 Pro",
    "Xiaomi 13T",
    "Xiaomi 13T Pro",
    "Xiaomi 14",
    "Xiaomi 14 Pro",
    "Xiaomi 14T",
    "Xiaomi 14T Pro",
  ];
  final List<String> infinixModels = [
    "Infinix GT 20 Pro",
    "Infinix Hot 40 Pro",
    "Infinix Hot 40i",
    "Infinix Hot 50 Pro+",
    "Infinix Hot 50i",
    "Infinix Note 30 VIP",
    "Infinix Note 30 Pro",
    "Infinix Note 40 Pro+ 5G",
    "Infinix Note 40 5G",
    "Infinix Note 50",
    "Infinix Note 50 Pro+",
    "Infinix Smart 8 Plus",
    "Infinix Smart 9 HD",
    "Infinix Zero 20",
    "Infinix Zero 30 5G",
    "Infinix Zero Flip",
    "Infinix Zero Ultra 5G",
    "Infinix Zero 5G",
    "Infinix Note 12 VIP",
    "Infinix Note 12 Pro 5G",
  ];
  final List<String> tecnoModels = [
    "Tecno Camon 20 Pro 5G",
    "Tecno Camon 30 Pro",
    "Tecno Camon 30 Premier",
    "Tecno Phantom V Fold 5G",
    "Tecno Phantom V Flip 5G",
    "Tecno Phantom X2",
    "Tecno Phantom X2 Pro",
    "Tecno Pova 5 Pro",
    "Tecno Pova 6 Pro 5G",
    "Tecno Pova 7",
    "Tecno Spark 10 Pro 5G",
    "Tecno Spark 9",
    "Tecno Pop 9 5G",
    "Tecno Pop 9 4G",
    "Tecno Pop 8",
    "Tecno Camon 19 Pro 5G",
    "Tecno Camon 19 Pro",
    "Tecno Camon 19",
    "Tecno Pova Neo 5G",
    "Tecno Pop 6 Go",
  ];

  @override
  Widget build(BuildContext context) {
    final setModel = ref.read(postAddStateNotifier.notifier);
    final whatBrand = ref.watch(postAddStateNotifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA6A6),
        centerTitle: true,
        title: Text("Select a Model", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xffffecec)),
              child: Align(
                alignment: Alignment.center,
                child: Text("POPULAR", style: TextStyle(color: Colors.black)),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: whatBrand.brand == "Apple"
                    ? appleModels.length
                    : whatBrand.brand == "Samsung"
                    ? samsungModels.length
                    : whatBrand.brand == "Techno"
                    ? tecnoModels.length
                    : whatBrand.brand == "Xiaomi"
                    ? xiaomiModels.length
                    : whatBrand.brand == "Infinix"
                    ? infinixModels.length
                    : 0,
                itemBuilder: (context, index) {
                  final modelName = whatBrand.brand == "Apple"
                      ? appleModels[index]
                      : whatBrand.brand == "Samsung"
                      ? samsungModels[index]
                      : whatBrand.brand == "Techno"
                      ? tecnoModels[index]
                      : whatBrand.brand == "Xiaomi"
                      ? xiaomiModels[index]
                      : whatBrand.brand == "Infinix"
                      ? infinixModels[index]
                      : ""



                  ;
                  return InkWell(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            modelName,
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            setModel.setModel(modelName);
                            setModel.setBrandChangeValue(false);
                            context.pop();
                          },
                        ),
                        Divider(thickness: 0.5, color: Color(0xff8391A1)),
                      ],
                    ),
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
