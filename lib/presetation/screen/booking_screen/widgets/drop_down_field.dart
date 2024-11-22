import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          filled: true,
          fillColor: const Color(0xFF0E151B),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white60),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
        dropdownColor: const Color(0xFF1A1A1A),
        items: const [
          DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
          DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
          DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
