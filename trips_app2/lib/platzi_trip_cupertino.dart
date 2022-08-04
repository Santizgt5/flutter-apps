import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app2/Place/ui/screen/home_trip.dart';
import 'package:trips_app2/User/bloc/bloc_user.dart';
import 'package:trips_app2/User/ui/screen/profile_trip.dart';
import 'package:trips_app2/Place/ui/screen/search_trip.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo)
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: const ProfileTrips(),
                  );
                },
              );
              break;
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
          }

        },
      ),
    );
  }

}