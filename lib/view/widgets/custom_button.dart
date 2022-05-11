
import 'package:flutter/material.dart';

import '../../constants.dart';




class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed, required this.text, this.color =  Colors.white});
  final VoidCallback onPressed;
  final String text;
  final Color? color ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: primaryColor,border:Border.all(color: Colors.white,width: 5)  ),
            
        child: TextButton(
          onPressed: onPressed,
          child:
              Text(text, style: TextStyle(color:color, fontSize: 20)),
        ));
  }
}
