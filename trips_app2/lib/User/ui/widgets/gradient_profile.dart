import 'package:flutter/material.dart';
import 'package:trips_app2/widgets/my_custom_clipper.dart';

class GradientProfile extends StatelessWidget {

  String title;
  double height;

  GradientProfile({ Key? key, this.title = 'Profile', this.height = 0.0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(),
        ClipPath(
          child: Container(color: const Color(0xFF4268D3).withOpacity(0.2), height: 375.0,),
          clipper: MyCustomClipper(),
        ),
        titleText(),
      ],
    );
    
    
  }


  Widget background() {
    return Container(
      height: height,
      decoration: const BoxDecoration(
         gradient: LinearGradient(
          colors: [
            Color(0xFF4268D3),
            Color(0xFF584CD1)
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
    );
  }

  Widget titleText() {
    return Container(
      alignment: const Alignment(-0.9, -0.86),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      )
    );
  }

}