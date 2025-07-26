import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  bool? isObsecure;
  final Icon? suffixIcon;

  CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isObsecure = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isObsecure!,
      validator: widget.validator,
      style: TextStyle(fontSize: 14, color: Color(0XFF3B3B3B)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        errorStyle: TextStyle(color: Colors.red),
        filled: true,
        fillColor: Colors.white, 
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withValues(
              alpha: 0.5,
            ), // Grey border with opacity
            width: 1.0, // Border thickness
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ), // Border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withValues(
              alpha: 0.7,
            ), // Slightly darker grey when focused
            width: 2.0, // Border thickness when focused
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ), // Border radius
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withValues(
              alpha: 0.7,
            ), // Slightly darker grey when focused
            width: 2.0, // Border thickness when focused
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ), // Border radius
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withValues(
              alpha: 0.7,
            ), // Slightly darker grey when focused
            width: 2.0, // Border thickness when focused
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ), // Border radius
        ),
        suffixIcon: (widget.suffixIcon != null)? IconButton(
          onPressed: () {
            setState(() {
              widget.isObsecure = !widget.isObsecure!;
            });
          },
          icon: widget.suffixIcon!,
        ): null
      ),
    );
  }
}
