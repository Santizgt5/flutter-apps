import 'package:flutter/material.dart';
import 'package:third_challenge/card_chat.dart';

class CardList extends StatelessWidget {
  const CardList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 120.0,
      ),
      child: Column(
        children: [
          CardChat(pathImage:'assets/img/lisa.jpg', namePerson: 'Lalisa Manoban', lastMessage: 'I love so much',),
          CardChat(pathImage:'assets/img/jisoo.jpg', namePerson: 'Kim Jisoo', lastMessage: 'How are you?',),
          CardChat(pathImage:'assets/img/jennie.jpg', namePerson: 'Jennie', lastMessage: 'I wake up at 6:00, Im tired',),
          CardChat(pathImage:'assets/img/rose.jpg', namePerson: 'Rose', lastMessage: 'Mi voice is beautiful',),
        ],
      ),
    );
  }
}