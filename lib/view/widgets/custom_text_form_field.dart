import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.text = '',
    this.hintText = '',
    this.onChanged, this.secondHintText='', this.secondOnChanged,
  });
  final String text;
  final String hintText;
  final String secondHintText;
  final void Function(String)? onChanged;
  final void Function(String)? secondOnChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 25,
                    color: Colors.white,

        ),
        SizedBox(height: 5,),
        CustomText(text: 'Number of units :',color: Colors.white,),
        
        TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white),
          onChanged: onChanged,
        ),
        SizedBox(height: 10,),
        CustomText(text: 'Number of used hours :',color: Colors.white,),
        
        TextFormField(
          decoration: InputDecoration(
              hintText: secondHintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white),
          onChanged: secondOnChanged,
        ),
      ],
    );
  }
}
