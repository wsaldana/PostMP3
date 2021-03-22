import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget{
  //Atributos

  //Contructor
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //body: , bgcolor grey[900]
      bottomNavigationBar: new NavBar()
    );
  }
}

class NavBar extends Container{
  Widget build(BuildContext context){
    return new Row(
      children: [
        buildNavItem(context, Icons.search, 0, true),
        buildNavItem(context, Icons.add, 1, false),
        buildNavItem(context, Icons.person, 2, false),
      ]
    );
  }

  Container buildNavItem(BuildContext context, IconData icon, int index, bool isActive){
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width/3,
      decoration: BoxDecoration(
        color: isActive ? Colors.redAccent[700] : Colors.black
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}