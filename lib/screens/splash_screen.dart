import 'package:flutter/material.dart';
import 'package:furniture_app/screens/item_list_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: ItemListScreen(),
      title: Text(
        "AR Furniture App",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: Colors.pink),
      ),
      image: Image.asset(
        'assets/icon.png',
      ),
      photoSize: 180,
      backgroundColor: Colors.white,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "By Pawandeep kaur",
        style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
      ),
    );
  }
}