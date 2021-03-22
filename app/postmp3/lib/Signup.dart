
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[

        new Positioned(
          child: new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/redBackground.png"),
                fit: BoxFit.cover
              )
            ),
            //color: Color.fromRGBO(0, 0, 0, 0.5)
          )
        ),

        new Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          body: new Padding(
            padding: const EdgeInsets.all(40.0),
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[

                  new Text(
                    "PostMP3",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontFamily: 'RacingSansOne'
                    )
                  ),

                  new Text(
                    "Rolas de ayer y hoy",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 21.0,
                      color: Colors.white,
                      fontFamily: 'Lobster'
                    )
                  ),

                  new Container(
                    margin: EdgeInsets.only(top: 20),
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          fontFamily: 'Baloo2'
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                        prefixIcon: Icon(Icons.emoji_emotions_outlined),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0)
                      ),
                      keyboardType: TextInputType.name, 
                    ),
                  ),

                  new Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontFamily: 'Baloo2'
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                        prefixIcon: Icon(Icons.lock_outline),
                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0)
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true, 
                    ),
                  ),

                  new InkWell(
                    child: new Container(
                      height: 50.0,
                      width: MediaQuery.of(context).copyWith().size.width,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(100.0),
                        gradient: new LinearGradient(
                          colors: [
                            Colors.grey[800],
                            Colors.black,
                            Colors.black,
                            Colors.grey[850],
                            Colors.black
                          ],
                          begin: Alignment.topLeft,
                          end : Alignment.bottomRight,
                        )
                      ),
                      child: new Center(
                        child: new Text(
                          "SIGN UP", 
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Baloo2',
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ),
                  )

                ]
              ),
            ),
          ) 
          
          
          
        )
        
      ],
    );
  }
}
