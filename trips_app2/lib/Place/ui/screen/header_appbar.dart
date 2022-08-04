import 'package:flutter/material.dart';
import 'package:trips_app2/widgets/gradient_back.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack(title: "Bienvenido"),
        const CardImageList()
      ],
    );
  }
}