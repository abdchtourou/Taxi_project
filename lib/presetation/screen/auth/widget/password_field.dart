import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
   PasswordField({super.key,required this.focusNode,required this.isHide});
  final FocusNode focusNode;
   bool? isHide;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      obscureText: widget.isHide!,

      decoration: InputDecoration(
        labelText: 'كلمة المرور',
        suffixIcon: IconButton(
          icon:!widget.isHide!? Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash),
          onPressed: (){
            setState(() {
              widget.isHide=!widget.isHide!;
              print(widget.isHide);
            });

          },
        ),
        labelStyle: TextStyle(
          color: widget.focusNode.hasFocus ? Colors.white : Colors.grey,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
    );
  }
}
