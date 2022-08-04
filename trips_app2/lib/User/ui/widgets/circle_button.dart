import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  IconData icon;
  bool small = false;

  CircleButton({ Key? key, required this.icon, required this.small, required this.onPressed }) : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {



  @override
  Widget build(BuildContext context) {
    return widget.small ? SizedBox(
      height: 35.0,
      width: 35.0,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.5),
          tooltip: "Add",
          onPressed: widget.onPressed,
          child: Icon(widget.icon, color: Colors.indigo, ),
          heroTag: null,
        )
      ),
    ) : FloatingActionButton(
      backgroundColor: Colors.white,
      tooltip: "Add",
      onPressed: widget.onPressed,
      child: Icon(widget.icon, color: Colors.indigo, size: 40, ),
      heroTag: null,
    );
  }
}