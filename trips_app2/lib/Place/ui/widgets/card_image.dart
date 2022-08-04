import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trips_app2/Place/model/place.dart';
import 'package:trips_app2/widgets/floating_action_button.dart';
import 'package:trips_app2/widgets/floating_action_card.dart';

class CardImage extends StatelessWidget {

  String pathImage;
  double heightC;
  double widthC;
  bool like;
  bool first;
  bool withoutMargin;
  VoidCallback onPressedFabIcon;
  final IconData iconData;
  Place? place = Place(name: "Knuckles Mountains Range", description: "Hiking, Water fall hunting, Natural bath, Scenery & Photography", likes: 4);
  
  CardImage({ Key? key, required this.onPressedFabIcon, required this.iconData, this.pathImage = "assets/img/lake.png", this.heightC = 350.0, this.widthC = 250.0, this.like = true, this.first = false, this.withoutMargin = true, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: heightC,
      width: widthC,
      margin: EdgeInsets.only(
        top: !first ? 80.0 : 20.0,
        left: like && withoutMargin ? 20.0 : 0.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: pathImage.contains('assets') || pathImage.contains('cache') ? pathImage.contains('assets') ? AssetImage(pathImage) : FileImage(File(pathImage)) as ImageProvider : NetworkImage(pathImage) as ImageProvider,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return like ?  
    Stack(
      alignment: const Alignment(0.9,1.1),
      children: [
        card,
        FloatingActionButtonGreen( iconData: iconData, onPressed: onPressedFabIcon,)
      ],
    ) : Stack(
      alignment: const Alignment(0, 1.5),
      clipBehavior: Clip.none,
      children: [
        card,
        FloatingActionCard(place: place!,),
        Positioned(
          left: 275,
          top: first ? 165 :240,
          child: FloatingActionButtonGreen( iconData: iconData, onPressed: onPressedFabIcon, )
        )
      ],
    );
  }
}