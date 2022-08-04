import 'package:flutter/material.dart';
import 'package:trips_app2/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Review(),
        Review(),
        Review(),
      ],
    );
  }
}