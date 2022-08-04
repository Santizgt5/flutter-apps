import 'package:flutter/material.dart';
import 'package:trips_app2/Place/ui/screen/home_trip.dart';
import 'package:trips_app2/User/ui/screen/profile_trip.dart';
import 'package:trips_app2/Place/ui/screen/search_trip.dart';

class Trips extends StatefulWidget {
  const Trips({ Key? key }) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {

  int _indexTap = 0;

   List<Widget> widgetsChildren = [
    HomeTrips(),  
    const SearchTrips(),
    const ProfileTrips()
  ];

    void _onTapTapped(int index) {
      setState(() {
        _indexTap = index;
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: widgetsChildren.elementAt(_indexTap),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ""
            )
        ],
        currentIndex: _indexTap,
        onTap: _onTapTapped,
        selectedItemColor: Colors.indigo,
      )
    );
  }
}