import 'package:flutter/material.dart';
import 'package:trips_app2/Place/model/place.dart';
import 'package:trips_app2/widgets/floating_action_button.dart';

class FloatingActionCard extends StatelessWidget {

  Place place;

  FloatingActionCard({ Key? key, required this.place }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final cardInfo = Container(
      height: 97,
      width: 253,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ] 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            place.name,
            style:const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 6,),
          Text(place.description,
            style:const TextStyle(
              fontFamily: 'Lato',
              fontSize: 9.0,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 6,),
          Text("Likes: ${place.likes}",
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 12.0,
              color: Color(0xFFF7941E)
            ),
          )
        ],
      ),
    );

    return cardInfo;
  }
}