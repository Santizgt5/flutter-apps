import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  String pathImage = 'assets/img/perfil.jpg';
  String name = "Varuna Yasas";
  String details = "1 review 5 photos";
  String comment = "There is an amazing place in Sri lanka";
  double starts = 3.5;

  Review({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userComment = Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 4.58
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 10.84,
          fontWeight: FontWeight.w900
        ),
      ),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 4.58
      ),
      child: Row(
        children: [
          Text(
            details,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 10.84,
              color: Color(0xFF939598)
            ),
          ),
          showStarts(starts)
        ],
      )
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 14.91
        ),
      ),
    );

    final userDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userName,
        userInfo,
        userComment
      ],
    );

    final photo = Container(
      margin: const EdgeInsets.only(
        left: 20.0
      ),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundImage: AssetImage(pathImage),
      ),
    ); 
    return  Container(
      margin: const EdgeInsets.only(
        top: 20
      ),
      child: Row( 
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            photo,
            userDetail
          ],
        ) ,
    );
  }

  Widget star(int typeStar) {
    return Container(
      child: decideStar(typeStar)
    );
  }

  Widget decideStar(int typeStar) {
    Icon star;
    switch (typeStar) {
      case 1:
        star = const Icon( 
          Icons.star,
          size: 11,
          color: Color(0xFFf2C611),);
        break;
      case 2:
        star = const Icon( 
          Icons.star_half,
          size: 11,
          color: Color(0xFFf2C611),);
        break;
      case 3:
        star = const Icon( 
          Icons.star_border,
          size: 11,
          color: Color(0xFFf2C611),);
        break;
      default:
      star = const Icon( 
          Icons.star,
          size: 11,
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
    return Container(
      margin: const EdgeInsets.only(
        left: 7.75,
      ),
      child: Row(children: finalStarts),
    );
   
  }
}