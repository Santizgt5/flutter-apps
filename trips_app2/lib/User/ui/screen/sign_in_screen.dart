import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app2/User/bloc/bloc_user.dart';
import 'package:trips_app2/User/model/user.dart' as userModel;
import 'package:trips_app2/User/ui/widgets/gradient_profile.dart';
import 'package:trips_app2/platzi_trip_cupertino.dart';
import 'package:trips_app2/widgets/button_green.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

  class SignInScreen extends StatefulWidget {
    const SignInScreen({ Key? key }) : super(key: key);
  
    @override
    State<SignInScreen> createState() => _SignInScreenState();
  }
  
  class _SignInScreenState extends State<SignInScreen> {
    late double screenWidth;
    late UserBloc userBloc;

    @override
    Widget build(BuildContext context) {
      screenWidth = MediaQuery.of(context).size.width;
      userBloc = BlocProvider.of(context);
      return _handleCurrentSession();
    }

    Widget _handleCurrentSession() {
      return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot- data - Object user
          if(!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          } else {
            return PlatziTripsCupertino();
          }
        },
      );
    }

    Widget signInGoogleUI() {
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            GradientProfile(title: '',height: MediaQuery.of(context).size.height),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                      margin: const EdgeInsets.only(
                      left: 30.0
                    ),
                    width: screenWidth,
                    child: const Text('Welcome \nThis is your travel App', 
                      style: TextStyle(
                        fontSize: 34.0,
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
                ButtonGreen(text: 'Login with Gmail', onPressed: () {
                  userBloc.signIn().then((User? user) {
                    userBloc.updateUserData(userModel.User(
                      uid: user?.uid,
                      name: user?.displayName,
                      email: user?.email,
                      photoURL: user?.photoURL
                    ));
                  });
                }, width: 300.0, height: 50.0,)
              ],
            ),
          ],
        ),
      );
    }

  }