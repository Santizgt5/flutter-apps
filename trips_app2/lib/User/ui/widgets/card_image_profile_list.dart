import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app2/Place/ui/widgets/card_image.dart';
import 'package:trips_app2/User/bloc/bloc_user.dart';

class CardImageProfileList extends StatelessWidget {

  late UserBloc userBloc;
  
  CardImageProfileList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 240.0
      ),
      child: StreamBuilder(
        stream: userBloc.placesListStream(),
        builder: (context, AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              return ListView(
                  children: userBloc.buildPlaces(snapshot.data.docs)
              );

            case ConnectionState.active:
              return ListView(
                  children: userBloc.buildPlaces(snapshot.data.docs)
              );

            case ConnectionState.none:
              return const CircularProgressIndicator();
            default:
              return ListView(
                  children: userBloc.buildPlaces(snapshot.data.docs)
              );

          }
        }

      ),
    );
  }

  // ListView(
  //       padding: const EdgeInsets.all(10.0),
  //       children: [
  //         CardImage(pathImage:  "assets/img/lake.jpg", iheghtC: 214.0, widthC: 350.0, like: false, first: true, iconData: Icons.favorite_border, onPressedFabIcon: () {},),
  //         CardImage(pathImage:  "assets/img/forest.jpg", heightC: 214.0, widthC: 350.0, like: false, iconData: Icons.favorite_border, onPressedFabIcon: () {},),
  //         CardImage(pathImage:  "assets/img/mountain.jpg",heightC: 214.0, widthC: 350.0,like: false, iconData: Icons.favorite_border, onPressedFabIcon: () {},),
  //         CardImage(pathImage:  "assets/img/river.jpeg", heightC: 214.0, widthC: 350.0,like: false, iconData: Icons.favorite_border, onPressedFabIcon: () {},),
  //         CardImage(pathImage:  "assets/img/beach.jpeg", heightC: 214.0, widthC: 350.0,like: false, iconData: Icons.favorite_border, onPressedFabIcon: () {},),
  //       ],
  //     ),
}