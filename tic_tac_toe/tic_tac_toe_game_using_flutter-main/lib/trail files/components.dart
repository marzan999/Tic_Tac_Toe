import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class CustomBox extends StatefulWidget {
  Function onTap;
  String name;
  CustomBox({Key? key, required this.onTap, required this.name})
      : super(key: key);

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap;
      },
      child: Container(
        width: MediaQuery.of(context).size.height / 10,
        height: MediaQuery.of(context).size.height / 10,
        margin: padAndMargin,
        padding: padAndMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: Text(
          widget.name,
          style: textStyle,
        ),
      ),
    );
  }
}
