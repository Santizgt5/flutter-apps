import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trips_app2/Place/ui/screen/add_place_screen.dart';
import 'package:trips_app2/User/bloc/bloc_user.dart';
import 'package:trips_app2/User/model/user.dart';
import 'package:trips_app2/User/ui/widgets/circle_button.dart';

class CardHeaderProfile extends StatelessWidget {

  late User user;
  late UserBloc userBloc;

  CardHeaderProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);
    


    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none: 
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot, context);
          case ConnectionState.done: 
            return showProfileData(snapshot, context);
        }
      },
    );
    
    /*
    */
  }

  Widget showProfileData(AsyncSnapshot snapshot, BuildContext context) {
    if(!snapshot.hasData || snapshot.hasError) {;
      return Container(
      margin: const EdgeInsets.only(
        top: 90.0,
      ),
      child: Column(
       children: const[
         CircularProgressIndicator(),
         Text("No se pudo cargar la información")
        ],
      )
    );
    } else {
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoURL);
      final photo = CircleAvatar(
      radius: 38.0,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundImage: NetworkImage(user.photoURL!),
        radius: 36.0,
      ),
    );

    final information = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name!,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
          ),
        ), 
        const SizedBox(height: 5.0,),
        Text(
          user.email!,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12.0,
            fontFamily: "Lato",
          ),
        )
      ],
    );

    final avatarInformation = Container(
      margin: const EdgeInsets.only(
        left: 24.0 
      ),
      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          photo,
          const SizedBox(width: 10.0,),
          information
        ],
      ),
    );


    final floatingButtoms = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleButton(icon: Icons.vpn_key, small: true, onPressed: () => {} ,),
        CircleButton(icon: Icons.add, small: false, onPressed: () {
            ImagePicker().pickImage(source: ImageSource.camera).then((image) {
              if(image  != null) {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: File(image.path))));
              } else {
                showDialog(
                  context: context, 
                  builder: (context) =>AlertDialog(
                    title: const Text('Advertencia'),
                    content: const Text("Toma la fotografia para continuar"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Ok'), 
                        child: const Text('Ok')
                      )
                    ],
                  )
                );
              }
            });  
          }
        ),
        CircleButton(icon: Icons.exit_to_app, small: true, onPressed: () => {
          userBloc.signOut()
        } ,),
      ],
    );

    return Container(
      margin: const EdgeInsets.only(
        top: 90.0,
      ),
      child: Column(
       children: [
          avatarInformation,
          const SizedBox(height: 10.0),
          floatingButtoms
        ],
      )
    );

    }
  }

}