import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.title,
      required this.color,
      @required this.onPressed1});
  final Color color;
  final String title;
  final dynamic onPressed1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:
              onPressed1, //to make this as the froster glass design then you have to add the function of material button inside the froster class !minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
