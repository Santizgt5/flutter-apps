import 'package:flutter/material.dart';

class CardChat extends StatelessWidget {

  String pathImage;
  String namePerson;
  String lastMessage;

  CardChat({ Key? key, required this.pathImage, required this.namePerson, required this.lastMessage }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final iconMessage = Container(
      margin: const EdgeInsets.only(
        right: 30,
      ),
      child: const Icon(
        Icons.mail,
        color: Color(0xFFF1A9BD),
      ),
    );

    final avatar = CircleAvatar(
      maxRadius: 30,
      backgroundImage: AssetImage(pathImage),
    );

    final text = Container(
      margin: const EdgeInsets.only(
        left: 20.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(namePerson, style: const TextStyle( fontWeight: FontWeight.bold  , fontSize: 15)),
          const SizedBox(height: 7),
          Text(lastMessage, style:  const TextStyle(fontSize: 11)),
        ],
      )
    );

    final tagChat = Row(
      children: [
        avatar,
        text
      ],
    );

    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 20.0,
        right: 20
      ), 
      padding: const EdgeInsets.only(
        bottom: 10.0
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.8
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tagChat,
          iconMessage
        ],
      ),
    ); 
    
  }
} 