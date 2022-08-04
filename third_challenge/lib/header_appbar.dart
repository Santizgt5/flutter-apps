import 'package:flutter/material.dart';
import 'package:third_challenge/my_custom_clipper.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: boxColor(),
          clipper: MyCustomClipper(),
        ),
       Container(
         child: const Icon(Icons.menu, color: Colors.white, size: 30,),
         margin: const EdgeInsets.only(
           top: 35,
           left: 20
         ),
       ) 
      ],
    );
  }

  Widget boxColor() {
    return Container(
      height: 150.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/img/blackpink.jpg")
        )
      ),
    );
  }
}