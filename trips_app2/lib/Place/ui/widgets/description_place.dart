import 'package:flutter/material.dart';
import '../../../widgets/button_purple.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {  

  String namePlace;
  double starts;
  String descriptionPlace;

  DescriptionPlace({ Key? key, required this.namePlace, required this.starts, required this.descriptionPlace  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {

     final titleText = Text(namePlace,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 30.0,
          fontWeight: FontWeight.w900
        ),
          textAlign: TextAlign.left,
        );

    final info = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            titleText,
            const SizedBox(width: 20.0,),
            showStarts(4.5)
          ]
        );

      final contenedorLittle = Container(
        margin: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
        ),
        child: info,
      );

      final contenedorBig = Container(
        margin: const EdgeInsets.only(
          top: 50.0,
          left: 20.0,
        ),
        child: info,
      );


      final titleStars = LayoutBuilder(builder: (context,constraints) {
              if(MediaQuery.of(context).size.height > 738) {
                  return contenedorBig;
                } else {
                  return contenedorLittle;
                }
              } 
            );

  
    final description = Container(
      child: Text(descriptionPlace, 
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 12.0, 
              color: Color(0xFF6D6E71),
              fontWeight: FontWeight.bold
              ),
          ),
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),
    );

    final fullDescription = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleStars,
        description,
        ButtonPurple(buttonText: "Navigate", onPressed: () {},)
      ],
    );
    return fullDescription;
  }

  Widget star(int typeStar) {
    return Container(
       margin: const EdgeInsets.only(
        top: 310.0,
        right: 3.0,
      ),
      child: decideStar(typeStar)
    );
  }

  Widget decideStar(int typeStar) {
    Icon star;
    switch (typeStar) {
      case 1:
        star = const Icon( 
          Icons.star,
          color: Color(0xFFf2C611),);
        break;
      case 2:
        star = const Icon( 
          Icons.star_half,
          color: Color(0xFFf2C611),);
        break;
      case 3:
        star = const Icon( 
          Icons.star_border,
          color: Color(0xFFf2C611),);
        break;
      default:
      star = const Icon( 
          Icons.star,
          color: Color(0xFFf2C611),);
    }

    return star;
  }

  Widget showStarts(double numberStars) {
    List<Widget> rowStarts = [];
    List<Widget> rowStartHalf = [];
    List<Widget> rowStarBorder= [];
    List.filled(numberStars.floor(), 0).forEach((i) => rowStarts.add(star(1)));
    List.filled(numberStars % 1 == 0 ? 0 : 1, 0).forEach((i) => rowStartHalf.add(star(2)));
    List.filled(5 - numberStars.round(), 0).forEach((i) => rowStarBorder.add(star(3)));
    List<Widget> finalStarts = [...rowStarts, ...rowStartHalf, ...rowStarBorder];
    return Row(children: finalStarts);
  }

}