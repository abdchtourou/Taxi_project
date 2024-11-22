import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? title;

  const ExpandableTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.title,
  }) : super(key: key);

  @override
  _ExpandableTextFieldState createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  final TextEditingController _controller = TextEditingController();
  double _height = 400.0; // Set initial height to 400 pixels

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display title if it is not null or empty
        if (widget.title != null && widget.title!.isNotEmpty)
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(height: 8.h),

        // Container wrapping the TextField
        Container(
          width: double.infinity, // Make sure it fills the available width
          height: _height, // Set dynamic height
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _height,
            curve: Curves.easeInOut,
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              maxLines: null,
              // Makes the TextField expandable vertically
              keyboardType: TextInputType.multiline,
              onChanged: (text) {
                setState(() {
                  // Update height based on content length
                  _height =
                      (_controller.text.split('\n').length * 24).toDouble();
                  if (_height < 400) _height = 400; // Minimum height
                  if (_height > 600) _height = 600; // Maximum height (optional)
                });
              },
              decoration: InputDecoration(
                labelText: widget.label,
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.sp,
                ),
                suffixIcon: Icon(widget.icon, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}