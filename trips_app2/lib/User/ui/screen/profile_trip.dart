import 'package:flutter/material.dart';
import 'package:trips_app2/User/ui/screen/card_header_profile.dart';
import 'package:trips_app2/User/ui/widgets/card_image_profile_list.dart';
import 'package:trips_app2/User/ui/widgets/gradient_profile.dart';

class ProfileTrips extends StatelessWidget {
  const ProfileTrips({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          GradientProfile(height: 375.0,),
          CardHeaderProfile(),
          CardImageProfileList()
        ],
    );  
  }
}