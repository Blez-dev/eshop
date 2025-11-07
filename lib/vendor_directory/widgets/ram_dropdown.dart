import 'package:eshop/vendor_directory/state_manager/image_picker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RamDropdown extends ConsumerStatefulWidget {
  final List<String> categories;
  final String hintText;

  const RamDropdown({super.key, required this.categories,required this.hintText});

  @override
  ConsumerState<RamDropdown> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends ConsumerState<RamDropdown> {
  String? selectedCategory; // Stores the currently selected category

  @override
  Widget build(BuildContext context) {
    final categorySetter =ref.read(postAddStateNotifier.notifier);
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Color(0xffF7F8F9),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.grey[200],
          value: selectedCategory,
          hint:  Text(
            widget.hintText,
            style: TextStyle(color: Colors.grey),
          ),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          items: widget.categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category,style: TextStyle(color: Colors.black),),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;

              categorySetter.setRamItem(selectedCategory!);
            });
          },
        ),
      ),
    );
  }
}
