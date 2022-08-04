import 'package:flutter/material.dart';
import 'package:trips_app2/Place/model/place.dart';

class User {
  final String? uid;
  final String? name;
  final String? email;
  final String? photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  // myFavoritePlaces
  // myPlaces

  User({
    Key? key,
    this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myPlaces,
    this.myFavoritePlaces
  });
  
}