
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final placeholder;
  final onChanged;
  final isPasswordField;
  const InputTextField({Key key, this.placeholder, this.onChanged, this.isPasswordField = false}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
              obscureText: isPasswordField,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
              )
            ),
        )
      ),
    );
  }
}

