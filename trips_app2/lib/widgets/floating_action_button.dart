import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({ Key? key, required this.iconData, required this.onPressed }) : super(key: key);

  @override
  State<FloatingActionButtonGreen> createState() => _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {

   bool pressed = false;

  // void onPressedFav(){
  //   setState(() {
  //       pressed = !pressed;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(
        pressed ? Icons.favorite : widget.iconData
      ),
      heroTag: null,
    );
  }
}