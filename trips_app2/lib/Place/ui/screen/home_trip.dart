import 'package:flutter/material.dart';
import 'package:trips_app2/Place/ui/widgets/description_place.dart';
import 'package:trips_app2/Place/ui/screen/header_appbar.dart';
import 'package:trips_app2/Place/ui/widgets/review_list.dart';


class HomeTrips extends StatelessWidget {
  String descriptionDummy = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, \n \nPretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a.";
  HomeTrips({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ListView(
            children: [
                DescriptionPlace(namePlace: "Bahamas",starts: 4.5, descriptionPlace: descriptionDummy,),
                const ReviewList()
            ],
          ),
          const HeaderAppBar()
        ],
    );
  }
}