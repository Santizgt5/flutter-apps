import 'package:flutter/material.dart';
import 'package:trips_app2/User/model/user.dart';

class Place {

  String? id;
  String name;
  String description;
  String? urlImage;
  int? likes;
  User? userOwner;

  Place({
    Key? key,
    required this.name,
    required this.description,
    this.urlImage,
    this.userOwner,
    this.likes,
  });
}