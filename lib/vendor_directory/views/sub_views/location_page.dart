import 'package:eshop/vendor_directory/state_manager/image_picker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LocationPage extends ConsumerStatefulWidget {
  const LocationPage({super.key});

  @override
  ConsumerState<LocationPage> createState() => _BrandPageState();
}

class _BrandPageState extends ConsumerState<LocationPage> {
  final List<String> locations = [
    "Abia",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Federal Capital Territory (Abuja)",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Yobe",
    "Zamfara",
  ];

  @override
  Widget build(BuildContext context) {
    final setBrand = ref.read(postAddStateNotifier.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA6A6),
        centerTitle: true,
        title: Text("Select a Location", style: TextStyle(color: Colors.black)),
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
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return InkWell(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            location,
                            style: TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            setBrand.setLocation(location);
                            context.pop();
                          },
                        ),
                        Divider(thickness: 0.5, color: Colors.black),
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
