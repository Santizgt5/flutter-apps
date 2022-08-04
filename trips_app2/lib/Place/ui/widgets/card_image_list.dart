import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app2/Place/ui/widgets/card_image.dart';
import 'package:trips_app2/User/bloc/bloc_user.dart';

class CardImageList extends StatelessWidget {

  const CardImageList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImage(pathImage:  "assets/img/lake.jpg", iconData: Icons.favorite_border, onPressedFabIcon: () {},),
          CardImage(pathImage:  "assets/img/forest.jpg", iconData: Icons.favorite_border, onPressedFabIcon: () {}),
          CardImage(pathImage:  "assets/img/mountain.jpg", iconData: Icons.favorite_border, onPressedFabIcon: () {}),
          CardImage(pathImage:  "assets/img/river.jpeg", iconData: Icons.favorite_border, onPressedFabIcon: () {}),
          CardImage(pathImage:  "assets/img/beach.jpeg", iconData: Icons.favorite_border, onPressedFabIcon: () {}),
        ],
      ),
    );
  }


// 


}